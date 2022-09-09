import 'flutter_driving_directions_platform_interface.dart';

class FlutterDrivingDirections {
  static Future<void> launchDirections({
    required double latitude,
    required double longitude,
    required String address,
  }) {
    return FlutterDrivingDirectionsPlatform.instance.launchDirections(
      latitude: latitude,
      longitude: longitude,
      address: address,
    );
  }
}
