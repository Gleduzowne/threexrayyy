# Create the directories
mkdir -p /home/nathfavour/Documents/code/gleduzowne/threexrayyy/lib/extensions
mkdir -p /home/nathfavour/Documents/code/gleduzowne/threexrayyy/lib/utils

# Create a sample extension file
cat <<EOL > /home/nathfavour/Documents/code/gleduzowne/threexrayyy/lib/extensions/sample_extension.dart
class SampleExtension {
  void execute() {
    // Sample extension logic
  }
}
EOL

# Create a sample utility file
cat <<EOL > /home/nathfavour/Documents/code/gleduzowne/threexrayyy/lib/utils/sample_util.dart
// filepath: /home/nathfavour/Documents/code/gleduzowne/threexrayyy/lib/utils/sample_util.dart
class SampleUtil {
  static String formatString(String input) {
    return input.toUpperCase();
  }
}
EOL
