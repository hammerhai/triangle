import 'dart:io' show Directory, FileSystemEntity, Platform;

import 'package:path/path.dart' as p;
import 'package:triangle/src/cache_directory.dart';
import 'package:triangle/src/configuration_directory.dart';
import 'package:triangle/src/data_directory.dart';
import 'package:triangle/src/environment.dart';

class TriangleProject {
  CacheDirectory? _cacheDirectory;
  ConfigurationDirectory? _configurationDirectory;
  DataDirectory? _dataDirectory;
  String? _home;
  String name;

  /// Creates a new instance for locating project directories.
  TriangleProject(this.name) {
    String os = Platform.operatingSystem;
    switch (os) {
      case 'linux':
      case 'macos':
      case 'windows':
        _home = Environment.getHome()?.path;
        if (Environment.hasHome(home: _home)) {
          _cacheDirectory = CacheDirectory(_home!, this);
          _configurationDirectory = ConfigurationDirectory(_home!, this);
          _dataDirectory = DataDirectory(_home!, this);
        }
        break;
    }
  }

  /// Finds the configuration directory.
  Directory? findConfigurationDirectory({createIfNotExists = false}) {
    return _configurationDirectory?.findConfiguration(
        createIfNotExists: createIfNotExists);
  }

  /// Finds the local data directory.
  Directory? findLocalDataDirectory({createIfNotExists = false}) {
    return _dataDirectory?.findLocalData(createIfNotExists: createIfNotExists);
  }

  /// Finds the preference directory.
  Directory? findPreferenceDirectory({createIfNotExists = false}) {
    return _configurationDirectory?.findPreference(
        createIfNotExists: createIfNotExists);
  }

  /// Finds the roaming data directory.
  Directory? findRoamingDataDirectory({createIfNotExists = false}) {
    return _dataDirectory?.findRoamingData(
        createIfNotExists: createIfNotExists);
  }

  /// Finds the local cache directory.
  Directory? findLocalCacheDirectory({createIfNotExists = false}) {
    return _cacheDirectory?.findLocal(createIfNotExists: createIfNotExists);
  }

  /// Shift the files of one directory to another.
  Future shiftDirectory(String from, String to) {
    var fromDirectory = Directory(from);
    List<FileSystemEntity> entities = fromDirectory.listSync(recursive: true);
    return Future.forEach(entities, (FileSystemEntity entity) {
      entity.rename(p.join(p.normalize(to), p.basename(entity.path)));
    });
  }
}
