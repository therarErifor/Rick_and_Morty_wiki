import 'dart:developer';

import 'package:sensors_plus/sensors_plus.dart';

enum PhonePosition{onLeftSide, onRightSide, vertical}

class RotationController {
  late final Stream<GyroscopeEvent> gyroscopeStream = gyroscopeEventStream();

  void start() {
    gyroscopeStream.listen(
      (GyroscopeEvent event) {
        log('x = ${event.x}, y = ${event.y}, z = ${event.z}');
      },
      onError: (error) {
        log('error gyroscope events listen');
      },
      cancelOnError: true,
    );
  }

  void _handleRotationEvents(){

  }

}
