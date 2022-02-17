import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:triangle/src/triangle_project.dart';

class CacheDirectory {
  final String _home;
  final TriangleProject _project;

  CacheDirectory(this._home, this._project);

  /// Finds the local cache directory, returning
  /// "C:\Users\current\AppData\Local\directories-example\cache" as a
  /// [Directory] object for example.
  Directory findLocal({createIfNotExists = false}) {
    late Directory directory;

    if (Platform.isLinux) {
      directory = Directory(p.join(_home, ".cache", _project.name));
    } else if (Platform.isMacOS) {
      directory = Directory(p.join(_home, "Library", "Caches", _project.name));
    } else if (Platform.isWindows) {
      directory =
          Directory(p.join(_home, "AppData", "Local", _project.name, "cache"));
    }

    if (createIfNotExists) {
      directory.createSync(recursive: true);
    }

    return directory;
  }
}
