import 'package:flutter/services.dart';
import 'package:flutter_driving_directions/flutter_driving_directions_method_channel.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelFlutterDrivingDirections platform =
      MethodChannelFlutterDrivingDirections();
  const MethodChannel channel = MethodChannel('flutter_driving_directions');

  final List<MethodCall> log = <MethodCall>[];

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      log.add(methodCall);
      return null;
    });
  });

  tearDown(() {
    log.clear();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('launchDirections sends correct arguments', () async {
    await platform.launchDirections(
      latitude: 42.0,
      longitude: -84.0,
      label: '123 Main Street',
    );

    expect(
      log,
      <Matcher>[
        isMethodCall(
          'launchDirections',
          arguments: <String, Object>{
            'latitude': 42.0,
            'longitude': -84.0,
            'label': '123 Main Street',
          },
        ),
      ],
    );
  });
}
