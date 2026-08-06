import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_driving_directions/flutter_driving_directions.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Driving Directions'),
        ),
        body: Center(
          child: FilledButton(
              onPressed: () => _launchNavigation(),
              child: const Text('Launch navigation'),
          ),
        ),
      ),
    );
  }

  Future<void> _launchNavigation() async {
    await FlutterDrivingDirections.launchDirections(
      latitude: 40.689247,
      longitude: -74.044502,
      label: 'Statue of Liberty',
    );
  }
}
