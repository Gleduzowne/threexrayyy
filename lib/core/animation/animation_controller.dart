import 'package:flutter/animation.dart';
import 'package:flutter/widgets.dart';

class CustomAnimationController {
  final TickerProvider vsync;
  late AnimationController controller;

  CustomAnimationController(
      {required this.vsync, Duration duration = const Duration(seconds: 5)}) {
    controller = AnimationController(vsync: vsync, duration: duration);
  }

  void start() {
    controller.repeat();
  }

  void stop() {
    controller.stop();
  }
}
