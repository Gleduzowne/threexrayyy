class Texture {
  final String imagePath;

  Texture(this.imagePath);

  Future<void> load() async {
    try {
      // Load texture from imagePath
      await Future.delayed(Duration(milliseconds: 300));
      // ...robust texture loading logic...
    } catch (error) {
      // Optionally log error
      rethrow;
    }
  }
}
