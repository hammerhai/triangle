import 'dart:io';

class Environment {
  /// Finds the home directory, returning "C:\Users\current" as a [Directory]
  /// object for example.
  static String getHome() {
    if (Platform.isLinux || Platform.isMacOS) {
      return Platform.environment['HOME']!;
    } else if (Platform.isWindows) {
      return Platform.environment['USERPROFILE']!;
    }

    return "";
  }
}
