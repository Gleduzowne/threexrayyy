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

  runApp(MyApp());

  // Load external plugin asynchronously after UI is displayed.
  manager.loadExternalPlugin(Uri.parse(
      'file:///home/nathfavour/Documents/code/gleduzowne/threexrayyy/plugins/my_plugin.dart'));
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
