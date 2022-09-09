import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_driving_directions_platform_interface.dart';

/// An implementation of [FlutterDrivingDirectionsPlatform] that uses method channels.
class MethodChannelFlutterDrivingDirections extends FlutterDrivingDirectionsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_driving_directions');

  @override
  Future<void> launchDirections({
    required double latitude,
    required double longitude,
    required String address,
  }) async {
    return await methodChannel.invokeMethod('launchDirections', <String, Object>{
      'latitude': latitude,
      'longitude': longitude,
      'address': address,
    });
  }
}
