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

  /// Checks if an existing home directory can be located.
  static bool hasHome({home}) {
    // Should provide a slight unnoticeable increase in performance as the
    // home directory isn't being searched for if it's already been
    // located
    if (home != null) {
      return Directory(home).existsSync();
    }
    return getHome() != null;
  }
}
