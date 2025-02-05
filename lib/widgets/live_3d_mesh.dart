import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:vector_math/vector_math_64.dart' as vector;

class Live3DMesh extends StatefulWidget {
  final Color meshColor;
  const Live3DMesh({super.key, this.meshColor = Colors.green});

  @override
  _Live3DMeshState createState() => _Live3DMeshState();
}

class _Live3DMeshState extends State<Live3DMesh> {
  double _rotationX = 0;
  double _rotationY = 0;
  Offset _lastFocalPoint = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleStart: (details) {
        _lastFocalPoint = details.focalPoint;
      },
      onScaleUpdate: (details) {
        final dx = details.focalPoint.dx - _lastFocalPoint.dx;
        final dy = details.focalPoint.dy - _lastFocalPoint.dy;
        setState(() {
          _rotationY += dx * 0.01;
          _rotationX -= dy * 0.01;
        });
        _lastFocalPoint = details.focalPoint;
      },
      child: Container(
        color: Colors.transparent,
        child: CustomPaint(
          painter: _Live3DMeshPainter(
            rotationX: _rotationX,
            rotationY: _rotationY,
            meshColor: widget.meshColor,
          ),
          child: Container(),
        ),
      ),
    );
  }
}

class _Live3DMeshPainter extends CustomPainter {
  final double rotationX;
  final double rotationY;
  final Color meshColor;

  _Live3DMeshPainter(
      {required this.rotationX,
      required this.rotationY,
      required this.meshColor});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = meshColor.withOpacity(0.7)
      ..style = PaintingStyle.stroke;

    // Define cube vertices.
    final cubeSize = math.min(size.width, size.height) / 4;
    final vertices = [
      vector.Vector3(-cubeSize, -cubeSize, -cubeSize),
      vector.Vector3(cubeSize, -cubeSize, -cubeSize),
      vector.Vector3(cubeSize, cubeSize, -cubeSize),
      vector.Vector3(-cubeSize, cubeSize, -cubeSize),
      vector.Vector3(-cubeSize, -cubeSize, cubeSize),
      vector.Vector3(cubeSize, -cubeSize, cubeSize),
      vector.Vector3(cubeSize, cubeSize, cubeSize),
      vector.Vector3(-cubeSize, cubeSize, cubeSize),
    ];

    // Apply rotations.
    final matrix = vector.Matrix4.identity()
      ..rotateX(rotationX)
      ..rotateY(rotationY);

    // Project vertices.
    List<Offset> projected = [];
    for (var v in vertices) {
      var transformed = matrix.transform3(v);
      double perspective = 500 / (500 - transformed.z);
      double x = transformed.x * perspective + size.width / 2;
      double y = transformed.y * perspective + size.height / 2;
      projected.add(Offset(x, y));
    }

    void drawLine(int i, int j) {
      canvas.drawLine(projected[i], projected[j], paint);
    }

    // Draw edges for front and back faces and connect them.
    drawLine(0, 1);
    drawLine(1, 2);
    drawLine(2, 3);
    drawLine(3, 0);
    drawLine(4, 5);
    drawLine(5, 6);
    drawLine(6, 7);
    drawLine(7, 4);
    drawLine(0, 4);
    drawLine(1, 5);
    drawLine(2, 6);
    drawLine(3, 7);
  }

  @override
  bool shouldRepaint(covariant _Live3DMeshPainter oldDelegate) {
    return oldDelegate.rotationX != rotationX ||
        oldDelegate.rotationY != rotationY ||
        oldDelegate.meshColor != meshColor;
  }
}
