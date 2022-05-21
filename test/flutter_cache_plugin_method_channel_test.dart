import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_cache_plugin/flutter_cache_plugin_method_channel.dart';

void main() {
  MethodChannelFlutterCachePlugin platform = MethodChannelFlutterCachePlugin();
  const MethodChannel channel = MethodChannel('flutter_cache_plugin');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
