import 'package:flutter/material.dart';

class RotationIcon extends StatefulWidget {
  const RotationIcon({super.key});

  @override
  State<RotationIcon> createState() => _RotationIconState();
}

class _RotationIconState extends State<RotationIcon> {

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 0.0,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 26,
          decoration: const BoxDecoration(
            color: Colors.blueGrey,
          ),
          child: const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FlutterLogo()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
