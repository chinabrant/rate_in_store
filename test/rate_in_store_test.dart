import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rate_in_store/rate_in_store.dart';

void main() {
  const MethodChannel channel = MethodChannel('rate_in_store');

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
    expect(await RateInStore.platformVersion, '42');
  });
}
