import 'package:flutter_driving_directions/flutter_driving_directions.dart';
import 'package:flutter_driving_directions/flutter_driving_directions_method_channel.dart';
import 'package:flutter_driving_directions/flutter_driving_directions_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterDrivingDirectionsPlatform
    with MockPlatformInterfaceMixin
    implements FlutterDrivingDirectionsPlatform {
  bool launchDirectionsCalled = false;
  double? lastLatitude;
  double? lastLongitude;
  String? lastAddress;

  @override
  Future<void> launchDirections({
    required double latitude,
    required double longitude,
    required String address,
  }) async {
    launchDirectionsCalled = true;
    lastLatitude = latitude;
    lastLongitude = longitude;
    lastAddress = address;
  }
}

void main() {
  final FlutterDrivingDirectionsPlatform initialPlatform =
      FlutterDrivingDirectionsPlatform.instance;

  test('$MethodChannelFlutterDrivingDirections is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterDrivingDirections>());
  });

  test('launchDirections delegates to platform instance', () async {
    MockFlutterDrivingDirectionsPlatform mockPlatform =
        MockFlutterDrivingDirectionsPlatform();
    FlutterDrivingDirectionsPlatform.instance = mockPlatform;

    await FlutterDrivingDirections.launchDirections(
      latitude: 42.0,
      longitude: -84.0,
      address: 'Test Address',
    );

    expect(mockPlatform.launchDirectionsCalled, isTrue);
    expect(mockPlatform.lastLatitude, 42.0);
    expect(mockPlatform.lastLongitude, -84.0);
    expect(mockPlatform.lastAddress, 'Test Address');
  });
}
