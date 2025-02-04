import 'package:flutter/material.dart';
import '../widgets/three_d_pane.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home View'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              // ...handle menu selection...
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'option1',
                child: Text('Option 1', style: TextStyle(fontSize: 10)),
              ),
              PopupMenuItem(
                value: 'option2',
                child: Text('Option 2', style: TextStyle(fontSize: 10)),
              ),
            ],
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(child: Text('Menu', style: TextStyle(fontSize: 10))),
            for (var i = 1; i <= 20; i++)
              ListTile(
                title: Text('Feature $i (Ctrl+$i)',
                    style: TextStyle(fontSize: 10)),
                onTap: () {
                  // ...handle feature navigation...
                },
              ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(child: ThreeDPane()),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard, size: 16), label: 'Dash'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings, size: 16), label: 'Settings'),
          BottomNavigationBarItem(
              icon: Icon(Icons.info, size: 16), label: 'Info'),
        ],
        selectedLabelStyle: TextStyle(fontSize: 10),
        unselectedLabelStyle: TextStyle(fontSize: 10),
      ),
    );
  }
}
