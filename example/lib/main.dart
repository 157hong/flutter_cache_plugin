import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_cache_plugin/flutter_cache_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String _temporaryDirectory = 'Unknown';
  String? _cacheSize = 'Unknown';
  String _cleanCache = 'Unknown';
  final _flutterCachePlugin = FlutterCachePlugin();



  @override
  void initState() {
    super.initState();
    _getTemporaryDirectory();
    _getTotalCacheSize();
  }

  // 临时目录下创建文件str，将字符串写入文件，返回文件目录
  Future<void> _getTemporaryDirectory() async {
    String temporaryDirectory;
    try {
      temporaryDirectory = await _flutterCachePlugin.getTemporaryDirectory() ?? 'Unknown Temporary Directory';
      File f = File("${temporaryDirectory}/str.txt");
      f.writeAsString("Temporary File");
      print('exists: ${f.existsSync()}');
      print("content:${await f.readAsString()}");
    } on PlatformException {
      temporaryDirectory = 'Failed to get Temporary Directory.';
    }
    if (!mounted) return;
    setState(() {
      _temporaryDirectory = temporaryDirectory;
    });
  }

  // 获取总缓存大小
  Future<String?> _getTotalCacheSize() async {
    String? cachesize;
    try{
      cachesize = await _flutterCachePlugin.getTotalCacheSize();
      print("size:  ${cachesize}");
    } on PlatformException {
      cachesize = 'Failed to get TotalCache size.';
    }
    setState((){
      _cacheSize = cachesize;
    });
  }

  // 清除缓存
  Future<void> _clearAllCache() async {
    String cleanCache;
    try{
      if (await _flutterCachePlugin.clearAllCache()){
        cleanCache = "clean success";
      }else {
        cleanCache = "clean failure";
      }
      print('${cleanCache}');
    } on PlatformException {
      cleanCache = 'Failed to clean cache.';
    }
    setState((){
      _cleanCache = cleanCache;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("缓存文件路劲：\n${_temporaryDirectory}"),
              Text("缓存大小：${_cacheSize}"),
              ElevatedButton(onPressed: (){
                _clearAllCache();
                _getTotalCacheSize();
              }, child: Text('clean cache'))
            ],
          ),
        ),
      ),
    );
  }
}
