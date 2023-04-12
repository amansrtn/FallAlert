// ignore_for_file: unused_field, library_private_types_in_public_api, unused_local_variable, no_leading_underscores_for_local_identifiers, avoid_print

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _myVariable = 0;
  num _accelX = 0.0;
  num _accelY = 0.0;
  num _accelZ = 0.0;
  num result = 0;
  @override
  void initState() {
    super.initState();
    accelerometerEvents.listen((AccelerometerEvent event) {
      _accelX = event.x.abs();
      _accelY = event.y.abs();
      _accelZ = event.z.abs();
      num x = pow(_accelX, 2);
      num y = pow(_accelY, 2);
      num z = pow(_accelZ, 2);
      num sum = x + y + z;
      result = sqrt(sum);
      if (result < 1 && _accelZ < 1) {
        setState(() {
          _myVariable = 1;
          print(result);
          print(_accelZ);
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My App'),
        ),
        body: Center(
          child: Text(
            'My variable is $_myVariable',
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
