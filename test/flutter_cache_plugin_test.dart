import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_cache_plugin/flutter_cache_plugin.dart';
import 'package:flutter_cache_plugin/flutter_cache_plugin_platform_interface.dart';
import 'package:flutter_cache_plugin/flutter_cache_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterCachePluginPlatform 
    with MockPlatformInterfaceMixin
    implements FlutterCachePluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterCachePluginPlatform initialPlatform = FlutterCachePluginPlatform.instance;

  test('$MethodChannelFlutterCachePlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterCachePlugin>());
  });

  test('getPlatformVersion', () async {
    FlutterCachePlugin flutterCachePlugin = FlutterCachePlugin();
    MockFlutterCachePluginPlatform fakePlatform = MockFlutterCachePluginPlatform();
    FlutterCachePluginPlatform.instance = fakePlatform;
  
    expect(await flutterCachePlugin.getPlatformVersion(), '42');
  });
}
