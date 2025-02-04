class Shape {
  final List<double> points;

  Shape(this.points);

  void draw() {
    if (points.length < 6) {
      // Assuming at least 3 (x,y) pairs are needed.
      throw Exception('Insufficient points for shape drawing.');
    }
    // Draw the shape using points
  }
}
