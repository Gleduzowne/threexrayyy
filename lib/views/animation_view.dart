import 'package:flutter/material.dart';
import '../widgets/animation_widget.dart';

class AnimationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation View'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              // ...handle selection...
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'tool1',
                child: Text('Tool 1', style: TextStyle(fontSize: 10)),
              ),
              PopupMenuItem(
                value: 'tool2',
                child: Text('Tool 2', style: TextStyle(fontSize: 10)),
              ),
            ],
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text('Tools', style: TextStyle(fontSize: 10))),
            for (var i = 1; i <= 15; i++)
              ListTile(
                title: Text('Animation Tool $i (Ctrl+${i + 2})',
                    style: TextStyle(fontSize: 10)),
                onTap: () {
                  // ...tool trigger...
                },
              ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(child: AnimationWidget()),
          // ...additional panels for controls...
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.play_arrow, size: 16), label: 'Play'),
          BottomNavigationBarItem(
              icon: Icon(Icons.pause, size: 16), label: 'Pause'),
          BottomNavigationBarItem(
              icon: Icon(Icons.stop, size: 16), label: 'Stop'),
        ],
        selectedLabelStyle: TextStyle(fontSize: 10),
        unselectedLabelStyle: TextStyle(fontSize: 10),
      ),
    );
  }
}
