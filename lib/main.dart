import 'package:flutter/material.dart';
import 'views/home_view.dart';
import 'extensions/plugin_interface.dart';
import 'extensions/chemistry_plugin.dart';
import 'extensions/computer_plugin.dart';
import 'extensions/mathematics_plugin.dart';
import 'extensions/physics_plugin.dart';
import 'extensions/external_plugin_loader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PluginManager manager = PluginManager();
  manager.initializePlugins();

  // Example external plugin loading.
  // Replace the URI with the path to your external plugin Dart file.
  await manager.loadExternalPlugin(Uri.parse(
      'file:///home/nathfavour/Documents/code/gleduzowne/threexrayyy/external/my_plugin.dart'));

  runApp(MyApp());
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
    // Built-in plugins.
    registerPlugin(ChemistryPlugin());
    registerPlugin(ComputerPlugin());
    registerPlugin(MathematicsPlugin());
    registerPlugin(PhysicsPlugin());
  }

  Future<void> loadExternalPlugin(Uri pluginUri) async {
    final loader = ExternalPluginLoader();
    await loader.loadPlugin(pluginUri, (plugin) => _plugins.add(plugin));
  }
}
