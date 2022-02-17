import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:triangle/src/triangle_project.dart';

class ConfigurationDirectory {
  final String _home;
  late final TriangleProject _project;

  ConfigurationDirectory(this._home, this._project);

  /// Finds the configuration directory.
  Directory findConfiguration({createIfNotExists = false}) {
    late Directory directory;

    if (Platform.isLinux) {
      directory = Directory(p.join(_home, ".config", _project.name));
    } else if (Platform.isMacOS) {
      directory = Directory(
          p.join(_home, "Library", "Application Support", _project.name));
    } else if (Platform.isWindows) {
      directory = Directory(
          p.join(_home, "AppData", "Roaming", _project.name, "config"));
    }

    if (createIfNotExists) {
      directory.createSync(recursive: true);
    }

    return directory;
  }

  /// Finds the preference directory.
  Directory findPreference({createIfNotExists = false}) {
    late Directory directory =
        findConfiguration(createIfNotExists: createIfNotExists);

    if (Platform.isMacOS) {
      directory =
          Directory(p.join(_home, "Library", "Preferences", _project.name));
    }

    if (createIfNotExists) {
      directory.createSync(recursive: true);
    }

    return directory;
  }
}
