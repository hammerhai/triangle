import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:triangle/src/environment.dart';
import 'package:triangle/src/triangle_project.dart';

class CacheDirectory {
  late final TriangleProject _project;

  CacheDirectory(this._project);

  /// Finds the local cache directory, returning
  /// "C:\Users\current\AppData\Local\directories-example\cache" as a
  /// [Directory] object for example.
  Directory? findLocal({createIfNotExists = false}) {
    var base = Environment.getHome();
    late Directory? directory;

    if (Platform.isLinux) {
      directory = Directory(p.join(base, ".cache", _project.name));
    } else if (Platform.isMacOS) {
      directory = Directory(p.join(base, "Library", "Caches", _project.name));
    } else if (Platform.isWindows) {
      directory =
          Directory(p.join(base, "AppData", "Local", _project.name, "cache"));
    }

    if (createIfNotExists) {
      directory?.createSync(recursive: true);
    }

    return directory;
  }
}
