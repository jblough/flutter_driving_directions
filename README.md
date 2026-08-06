# flutter_driving_directions

A Flutter plugin to launch native driving directions on Android and iOS.

On Android, it opens **Google Maps** via Intent. On iOS, it opens **Apple Maps** using native MapKit.


## Installation:

In your pubspec.yaml
```
dependencies:
  flutter_driving_directions: ^3.0.2
```

## Sample Usage

Import the package:

```dart
import 'package:flutter_driving_directions/flutter_driving_directions.dart';
```

Launch directions to a specific coordinate and label/address:

```dart
await FlutterDrivingDirections.launchDirections(
  latitude: 40.689247,
  longitude: -74.044502,
  label: 'Statue of Liberty',
);
```

## Platform Setup

### Android
Add the following to your `AndroidManifest.xml` to support package visibility on Android 11+:

```xml
<queries>
    <package android:name="com.google.android.apps.maps" />
</queries>
```

### iOS
No additional setup is required.
