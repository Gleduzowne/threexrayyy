import 'dart:isolate';
import 'plugin_interface.dart';

class ExternalPluginLoader {
  // Loads an external plugin from given URI.
  // Note: This approach uses isolates; ensure your environment supports Isolate.spawnUri.
  Future<void> loadPlugin(
      Uri pluginUri, void Function(Plugin plugin) onPluginLoaded) async {
    final receivePort = ReceivePort();
    await Isolate.spawnUri(pluginUri, [], receivePort.sendPort);
    await for (var message in receivePort) {
      // Expecting an instance of Plugin passed from the external isolate.
      if (message is Plugin) {
        onPluginLoaded(message);
        message.register();
        break; // Stop listening after receiving the plugin instance.
      }
    }
  }
}
