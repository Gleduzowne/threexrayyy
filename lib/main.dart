import 'package:flutter/material.dart';
import 'views/home_view.dart';
import 'extensions/plugin_interface.dart';
import 'extensions/chemistry_plugin.dart';
import 'extensions/computer_plugin.dart';
import 'extensions/mathematics_plugin.dart';
import 'extensions/physics_plugin.dart';

void main() {
  runApp(MyApp());
  PluginManager().initializePlugins();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'threexrayyy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeView(),
    );
  }
}

class PluginManager {
  final List<Plugin> _plugins = [];

  void registerPlugin(Plugin plugin) {
    plugin.register();
    _plugins.add(plugin);
  }

  void initializePlugins() {
    // Register plugins. In a real-world scenario these
    // could be dynamically discovered.
    registerPlugin(ChemistryPlugin());
    registerPlugin(ComputerPlugin());
    registerPlugin(MathematicsPlugin());
    registerPlugin(PhysicsPlugin());
  }
}
