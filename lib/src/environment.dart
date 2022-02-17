import 'dart:io';

class Environment {
  /// Finds the home directory.
  static String? getHome() {
    Directory? home;

    if (Platform.isLinux || Platform.isMacOS) {
      home = Directory(Platform.environment['HOME']!);
    } else if (Platform.isWindows) {
      home = Directory(Platform.environment['USERPROFILE']!);
    }

    if (home?.existsSync() ?? false) {
      return home!.path;
    }

    return null;
  }

  /// Checks if the located home directory exists.
  static bool hasHome({home}) {
    if (home != null) {
      return Directory(home).existsSync();
    }

    return getHome() != null;
  }
}
