import 'flutter_driving_directions_platform_interface.dart';

class FlutterDrivingDirections {
  static Future<void> launchDirections({
    required double latitude,
    required double longitude,
    required String label,
  }) {
    return FlutterDrivingDirectionsPlatform.instance.launchDirections(
      latitude: latitude,
      longitude: longitude,
      label: label,
    );
  }
}
