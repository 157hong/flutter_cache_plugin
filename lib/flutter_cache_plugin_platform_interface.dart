import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_cache_plugin_method_channel.dart';

abstract class FlutterCachePluginPlatform extends PlatformInterface {
  /// Constructs a FlutterCachePluginPlatform.
  FlutterCachePluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterCachePluginPlatform _instance = MethodChannelFlutterCachePlugin();

  /// The default instance of [FlutterCachePluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterCachePlugin].
  static FlutterCachePluginPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterCachePluginPlatform] when
  /// they register themselves.
  static set instance(FlutterCachePluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getTemporaryDirectory() {
    throw UnimplementedError('getTemporaryDirectory() has not been implemented.');
  }

  Future<String?> getTotalCacheSize() {
    throw UnimplementedError('getTotalCacheSize() has not been implemented.');
  }

  Future<bool> clearAllCache() {
    throw UnimplementedError('clearAllCache() has not been implemented.');
  }
}
