import 'package:flutter/material.dart';
import 'animation_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home View'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => AnimationView()));
          },
          child: Text('Go to Animation'),
        ),
      ),
    );
  }
}
