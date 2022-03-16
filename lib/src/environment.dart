import 'dart:io';

class Environment {
  /// Finds the home directory.
  static Directory getHome() {
    return Directory(
        Platform.environment['HOME'] ?? Platform.environment['USERPROFILE']!);
  }
}
