import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class FlutterDrivingDirections {
  static const MethodChannel _channel =
      const MethodChannel('flutter_driving_directions');

  static Future<void> launchDirections({
    @required double latitude,
    @required double longitude,
    @required String address,
  }) async {
    return await _channel.invokeMethod('directions', <String, Object>{
      'latitude': latitude,
      'longitude': longitude,
      'address': address,
    });
  }
}
