import 'package:flutter/material.dart';
import '../widgets/animation_widget.dart';

class AnimationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation View'),
      ),
      body: Center(
        child: AnimationWidget(),
      ),
    );
  }
}
