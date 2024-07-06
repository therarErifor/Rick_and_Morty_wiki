import 'package:flutter/material.dart';
import 'package:manual_screen_rotation/src/services/rotation_controller.dart';
import 'features/settings_page.dart';

class ScreenRotationApp extends StatelessWidget {
  ScreenRotationApp({super.key});

  final RotationController rotationController = RotationController();

  @override
  Widget build(BuildContext context) {

    rotationController.start();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const SettingsPage(),
    );
  }
}