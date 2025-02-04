double lerp(double a, double b, double t) {
  t = t.clamp(0.0, 1.0) as double;
  return a + (b - a) * t;
}

double easeInOut(double t) {
  t = t.clamp(0.0, 1.0) as double;
  return t * t * (3 - 2 * t);
}

// ...other animation utilities...
