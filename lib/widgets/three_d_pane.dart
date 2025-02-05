import 'package:flutter/material.dart';
import 'live_3d_mesh.dart';

class ThreeDPane extends StatelessWidget {
  final Color meshColor;
  const ThreeDPane({super.key, required this.meshColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: Center(
        child: Live3DMesh(meshColor: meshColor),
      ),
    );
  }
}
