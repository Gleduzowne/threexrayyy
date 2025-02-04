import 'texture.dart';

class Mesh {
  final List<double> vertices;
  final List<int> indices;
  final Texture texture;

  Mesh(this.vertices, this.indices, this.texture);

  void render() {
    // Render the mesh using vertices, indices, and texture
  }
}
