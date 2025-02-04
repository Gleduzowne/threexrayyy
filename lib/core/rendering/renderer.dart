import '../../models/2d/sprite.dart';
import '../../models/2d/shape.dart';
import '../../models/3d/mesh.dart';

class Renderer {
  // ...existing code...

  void render2D(Sprite sprite) {
    sprite.draw();
  }

  void render2DShape(Shape shape) {
    shape.draw();
  }

  void render3D(Mesh mesh) {
    mesh.render();
  }
}
