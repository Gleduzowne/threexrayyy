import 'package:flutter/material.dart';
import '../widgets/three_d_pane.dart';
import '../widgets/mesh_controls.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Color _meshColor = Colors.green;

  void _exportPNG() {
    // TODO: Implement PNG export logic (e.g., using a RepaintBoundary).
    // Placeholder:
    print('Exporting PNG...');
  }

  void _exportMP4() {
    // TODO: Implement MP4 export logic (e.g., record a rotating animation).
    // Placeholder:
    print('Exporting MP4...');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home View'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              // ...handle menu selection...
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'option1',
                child: Text('Option 1', style: TextStyle(fontSize: 10)),
              ),
              const PopupMenuItem(
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
            const DrawerHeader(
                child: Text('Menu', style: TextStyle(fontSize: 10))),
            for (var i = 1; i <= 20; i++)
              ListTile(
                title: Text('Feature $i (Ctrl+$i)',
                    style: const TextStyle(fontSize: 10)),
                onTap: () {
                  // ...handle feature navigation...
                },
              ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(child: ThreeDPane(meshColor: _meshColor)),
          MeshControls(
            selectedColor: _meshColor,
            onColorChanged: (color) {
              setState(() {
                _meshColor = color;
              });
            },
            onExportPNG: _exportPNG,
            onExportMP4: _exportMP4,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard, size: 16), label: 'Dash'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings, size: 16), label: 'Settings'),
          BottomNavigationBarItem(
              icon: Icon(Icons.info, size: 16), label: 'Info'),
        ],
        selectedLabelStyle: const TextStyle(fontSize: 10),
        unselectedLabelStyle: const TextStyle(fontSize: 10),
      ),
    );
  }
}
