import 'package:flutter/material.dart';

class MeshControls extends StatelessWidget {
  final Color selectedColor;
  final ValueChanged<Color> onColorChanged;
  final VoidCallback onExportPNG;
  final VoidCallback onExportMP4;

  const MeshControls({
    super.key,
    required this.selectedColor,
    required this.onColorChanged,
    required this.onExportPNG,
    required this.onExportMP4,
  });

  // Predefined color options.
  static final Map<String, Color> colorOptions = {
    'Green': Colors.green,
    'Blue': Colors.blue,
    'Red': Colors.red,
    'Orange': Colors.orange,
    'Purple': Colors.purple,
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Color selector.
        DropdownButton<Color>(
          value: selectedColor,
          items: colorOptions.entries
              .map((entry) => DropdownMenuItem<Color>(
                    value: entry.value,
                    child: Text(entry.key),
                  ))
              .toList(),
          onChanged: (color) {
            if (color != null) onColorChanged(color);
          },
        ),
        const SizedBox(height: 10),
        // Export buttons.
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: onExportPNG,
              child: const Text('Export PNG'),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: onExportMP4,
              child: const Text('Export MP4'),
            ),
          ],
        ),
      ],
    );
  }
}
