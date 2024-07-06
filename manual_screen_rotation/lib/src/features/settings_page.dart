import 'dart:async';
import 'dart:developer';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _receivePort = ReceivePort();
  SendPort? homePort;
  String? latestMessageFromOverlay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings page'),
      ),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    const gap = SizedBox(height: 6);

    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () async {
              final status = await FlutterOverlayWindow.isPermissionGranted();
              log("Is Permission Granted: $status");
            },
            child: const Text("Check Permission"),
          ),
          gap,
          TextButton(
            onPressed: () async {
              final bool? res = await FlutterOverlayWindow.requestPermission();
              log("status: $res");
            },
            child: const Text("Request Permission"),
          ),
          gap,
          TextButton(
            onPressed: () async {
              if (await FlutterOverlayWindow.isActive()) return;
              Timer(
                const Duration(seconds: 3),
                () => FlutterOverlayWindow.closeOverlay(),
              );
              await FlutterOverlayWindow.showOverlay(
                  flag: OverlayFlag.defaultFlag,
                  enableDrag: false,
                  positionGravity: PositionGravity.none,
                  height: 50,
                  width: 50,
                  startPosition: OverlayPosition(width * 0.44, height * 0.48));
            },
            child: const Text("Show Overlay"),
          ),
          gap,
          TextButton(
            onPressed: () async {
              final status = await FlutterOverlayWindow.isActive();
              log("Is Active?: $status");
            },
            child: const Text("Is Active?"),
          ),
          gap,
          TextButton(
            onPressed: () {
              log('Try to close');
              FlutterOverlayWindow.closeOverlay()
                  .then((value) => log('STOPPED: alue: $value'));
            },
            child: const Text("Close Overlay"),
          ),
          gap,
          TextButton(
            onPressed: () {
              FlutterOverlayWindow.getOverlayPosition().then((value) {
                log('Overlay Position: $value');
                setState(() {
                  latestMessageFromOverlay = 'Overlay Position: $value';
                });
              });
            },
            child: const Text("Get overlay position"),
          ),
          gap,
          TextButton(
            onPressed: () {
              FlutterOverlayWindow.moveOverlay(
                const OverlayPosition(0, 0),
              );
            },
            child: const Text("Move overlay position to (0, 0)"),
          ),
          const SizedBox(height: 20),
          Text(latestMessageFromOverlay ?? ''),
        ],
      ),
    );
  }
}
