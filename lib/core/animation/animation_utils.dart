double lerp(double a, double b, double t) {
  // ...existing utility logic...
  return a + (b - a) * t;
}

// ...other animation utilities...

double easeInOut(double t) {
  return t * t * (3 - 2 * t);
}
