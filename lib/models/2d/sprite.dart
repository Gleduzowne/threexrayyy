class Sprite {
  final String imagePath;
  final double x;
  final double y;

  Sprite(this.imagePath, this.x, this.y);

  void draw() {
    if (imagePath.isEmpty) {
      throw Exception('Sprite imagePath is empty.');
    }
    // Draw the sprite at (x, y) using imagePath
  }
}
