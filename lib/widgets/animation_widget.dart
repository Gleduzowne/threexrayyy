import 'package:flutter/material.dart';
import 'custom_painter.dart';

class AnimationWidget extends StatefulWidget {
  @override
  _AnimationWidgetState createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // ...existing initialization...
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5))
          ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    // ...existing disposal...
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ...existing build logic...
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: MyCustomPainter(),
          child: Container(),
        );
      },
    );
  }
}
