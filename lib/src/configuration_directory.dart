import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:triangle/src/environment.dart';
import 'package:triangle/src/triangle_project.dart';

class ConfigurationDirectory {
  late final TriangleProject _project;

  ConfigurationDirectory(this._project);

  /// Finds the configuration directory, returning
  /// "C:\Users\current\AppData\Roaming\directories-example\config" as a
  /// [Directory] object for example.
  Directory? findConfiguration({createIfNotExists = false}) {
    var base = Environment.getHome();
    late Directory? directory;

    if (Platform.isLinux) {
      directory = Directory(p.join(base, ".config", _project.name));
    } else if (Platform.isMacOS) {
      directory = Directory(
          p.join(base, "Library", "Application Support", _project.name));
    } else if (Platform.isWindows) {
      directory = Directory(
          p.join(base, "AppData", "Roaming", _project.name, "config"));
    }

    if (createIfNotExists) {
      directory?.createSync(recursive: true);
    }

    return directory;
  }

  /// Finds the preference directory, returning
  /// "C:\Users\current\AppData\Roaming\directories-example\config" as a
  /// [Directory] object for example.
  Directory? findPreference({createIfNotExists = false}) {
    var base = Environment.getHome();
    late Directory? directory =
        findConfiguration(createIfNotExists: createIfNotExists);

    if (Platform.isMacOS) {
      directory =
          Directory(p.join(base, "Library", "Preferences", _project.name));
    }

    if (createIfNotExists) {
      directory?.createSync(recursive: true);
    }

    return directory;
  }
}
