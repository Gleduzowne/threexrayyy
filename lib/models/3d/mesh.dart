import 'texture.dart';

class Mesh {
  final List<double> vertices;
  final List<int> indices;
  final Texture texture;

  Mesh(this.vertices, this.indices, this.texture);

  void render() {
    if (vertices.isEmpty || indices.isEmpty) {
      throw Exception('Mesh data missing: vertices or indices are empty.');
    }
    // Render the mesh using vertices, indices, and texture
  }
}
