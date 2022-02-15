import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:triangle/src/environment.dart';
import 'package:triangle/src/triangle_project.dart';

class DataDirectory {
  late final TriangleProject _project;

  DataDirectory(this._project);

  /// Finds the data directory, returning
  /// "C:\Users\current\AppData\Local\directories-example\data" as a
  /// [Directory] object for example.
  Directory? findLocalData({createIfNotExists = false}) {
    var base = Environment.getHome();
    late Directory? directory;

    if (Platform.isLinux) {
      directory = Directory(p.join(base, ".local", "share", _project.name));
    } else if (Platform.isMacOS) {
      directory = Directory(
          p.join(base, "Library", "Application Support", _project.name));
    } else if (Platform.isWindows) {
      directory =
          Directory(p.join(base, "AppData", "Local", _project.name, "data"));
    }

    if (createIfNotExists) {
      directory?.createSync(recursive: true);
    }

    return directory;
  }

  /// Finds the data directory, returning
  /// "C:\Users\current\AppData\Roaming\directories-example\data" as a
  /// [Directory] object for example.
  Directory? findRoamingData({createIfNotExists = false}) {
    var base = Environment.getHome();
    var directory = findLocalData();

    if (Platform.isWindows) {
      directory =
          Directory(p.join(base, "AppData", "Roaming", _project.name, "data"));
    }

    if (createIfNotExists) {
      directory?.createSync(recursive: true);
    }

    return directory;
  }
}
