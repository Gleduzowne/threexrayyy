# Create the utils directory
mkdir -p /home/nathfavour/Documents/code/gleduzowne/threexrayyy/lib/utils

# Create a math utility file
cat <<EOL > /home/nathfavour/Documents/code/gleduzowne/threexrayyy/lib/utils/math_utils.dart
class MathUtils {
  static double degreesToRadians(double degrees) {
    return degrees * (3.141592653589793 / 180.0);
  }

  static double radiansToDegrees(double radians) {
    return radians * (180.0 / 3.141592653589793);
  }
}
EOL

# Create a file utility file
cat <<EOL > /home/nathfavour/Documents/code/gleduzowne/threexrayyy/lib/utils/file_utils.dart
// filepath: /home/nathfavour/Documents/code/gleduzowne/threexrayyy/lib/utils/file_utils.dart
import 'dart:io';

class FileUtils {
  static Future<String> readFile(String path) async {
    final file = File(path);
    return await file.readAsString();
  }

  static Future<void> writeFile(String path, String content) async {
    final file = File(path);
    await file.writeAsString(content);
  }
}
EOL

# Create a string utility file
cat <<EOL > /home/nathfavour/Documents/code/gleduzowne/threexrayyy/lib/utils/string_utils.dart
// filepath: /home/nathfavour/Documents/code/gleduzowne/threexrayyy/lib/utils/string_utils.dart
class StringUtils {
  static String capitalize(String input) {
    if (input.isEmpty) return input;
    return input[0].toUpperCase() + input.substring(1);
  }

  static bool isPalindrome(String input) {
    String reversed = input.split('').reversed.join('');
    return input == reversed;
  }
}
EOL
