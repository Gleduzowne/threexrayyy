import 'dart:io';
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

  Future<String?> _chooseFilePath(String title, String defaultName) async {
    String? path;
    await showDialog(
      context: context,
      builder: (context) {
        final controller =
            TextEditingController(text: '/your/path/$defaultName');
        return AlertDialog(
          title: Text(title, style: const TextStyle(fontSize: 10)),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Enter full file path'),
            style: const TextStyle(fontSize: 10),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel', style: TextStyle(fontSize: 10)),
            ),
            TextButton(
              onPressed: () {
                path = controller.text;
                Navigator.of(context).pop();
              },
              child: const Text('OK', style: TextStyle(fontSize: 10)),
            ),
          ],
        );
      },
    );
    return path;
  }

  Future<void> _exportPNG() async {
    final filePath = await _chooseFilePath('Save PNG', 'mesh.png');
    if (filePath != null && filePath.isNotEmpty) {
      // TODO: Replace with actual PNG export logic, e.g., capturing a RepaintBoundary.
      print('Exporting PNG to $filePath');
      // ...existing PNG export logic...
    }
  }

  Future<void> _exportMP4() async {
    final filePath = await _chooseFilePath('Save MP4', 'mesh.mp4');
    if (filePath != null && filePath.isNotEmpty) {
      // Dummy command to demonstrate ffmpeg CLI usage.
      // In practice, you'd generate a series of frames and then run ffmpeg to create a video.
      final ffmpegCmd =
          'ffmpeg -y -f lavfi -i testsrc=duration=5:size=320x240:rate=30 $filePath';
      print('Running command: $ffmpegCmd');
      final result = await Process.run('sh', ['-c', ffmpegCmd]);
      if (result.exitCode == 0) {
        print('Exported MP4 successfully to $filePath');
      } else {
        print('Failed to export MP4: ${result.stderr}');
      }
    }
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
