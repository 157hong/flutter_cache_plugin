import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_cache_plugin_platform_interface.dart';

/// An implementation of [FlutterCachePluginPlatform] that uses method channels.
class MethodChannelFlutterCachePlugin extends FlutterCachePluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_cache_plugin');

  @override
  Future<String?> getTemporaryDirectory() async {
    final path = await methodChannel.invokeMethod('getTemporaryDirectory');
    return path;
  }

  @override
  Future<String?> getTotalCacheSize() async {
    final size = await methodChannel.invokeMethod('getTotalCacheSize');
    return size;
  }

  @override
  Future<bool> clearAllCache() async {
    return await methodChannel.invokeMethod("clearAllCache");
  }
}
