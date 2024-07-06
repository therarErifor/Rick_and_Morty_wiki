import 'package:flutter/material.dart';
import 'src/ui/rotation_icon.dart';
import 'src/screen_rotation_app.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  runApp(ScreenRotationApp());
}

@pragma("vm:entry-point")
void overlayMain() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: RotationIcon(),
  ));
}