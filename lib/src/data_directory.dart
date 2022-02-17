import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:triangle/src/triangle_project.dart';

class DataDirectory {
  final String _home;
  late final TriangleProject _project;

  DataDirectory(this._home, this._project);

  /// Finds the local data directory.
  Directory findLocalData({createIfNotExists = false}) {
    late Directory directory;

    if (Platform.isLinux) {
      directory = Directory(p.join(_home, ".local", "share", _project.name));
    } else if (Platform.isMacOS) {
      directory = Directory(
          p.join(_home, "Library", "Application Support", _project.name));
    } else if (Platform.isWindows) {
      directory =
          Directory(p.join(_home, "AppData", "Local", _project.name, "data"));
    }

    if (createIfNotExists) {
      directory.createSync(recursive: true);
    }

    return directory;
  }

  /// Finds the roaming data directory.
  Directory findRoamingData({createIfNotExists = false}) {
    var directory = findLocalData();

    if (Platform.isWindows) {
      directory =
          Directory(p.join(_home, "AppData", "Roaming", _project.name, "data"));
    }

    if (createIfNotExists) {
      directory.createSync(recursive: true);
    }

    return directory;
  }
}
