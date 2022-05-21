
import 'flutter_cache_plugin_platform_interface.dart';

class FlutterCachePlugin {

  Future<String?> getTemporaryDirectory() {
    return FlutterCachePluginPlatform.instance.getTemporaryDirectory();
  }

  Future<String?> getTotalCacheSize() {
    return FlutterCachePluginPlatform.instance.getTotalCacheSize();
  }

  Future<bool> clearAllCache() {
    return FlutterCachePluginPlatform.instance.clearAllCache();
  }

}
