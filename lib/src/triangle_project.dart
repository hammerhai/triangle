import 'dart:io';

import 'package:triangle/src/cache_directory.dart';
import 'package:triangle/src/configuration_directory.dart';
import 'package:triangle/src/data_directory.dart';
import 'package:triangle/src/environment.dart';

class TriangleProject {
  CacheDirectory? _cacheDirectory;
  ConfigurationDirectory? _configurationDirectory;
  DataDirectory? _dataDirectory;
  final String? _home = Environment.getHome();

  String name;

  TriangleProject(this.name) {
    String os = Platform.operatingSystem;
    switch (os) {
      case 'linux':
      case 'macos':
      case 'windows':
        if (Environment.hasHome(home: _home)) {
          _cacheDirectory = CacheDirectory(_home!, this);
          _configurationDirectory = ConfigurationDirectory(_home!, this);
          _dataDirectory = DataDirectory(_home!, this);
        }
        break;
    }
  }

  /// Finds the configuration directory, returning
  /// "C:\Users\current\AppData\Roaming\directories-example\config" as a
  /// [Directory] object for example.
  Directory? findConfigurationDirectory({createIfNotExists = false}) {
    return _configurationDirectory?.findConfiguration(
        createIfNotExists: createIfNotExists);
  }

  /// Finds the data directory, returning
  /// "C:\Users\current\AppData\Local\directories-example\data" as a
  /// [Directory] object for example.
  Directory? findLocalDataDirectory({createIfNotExists = false}) {
    return _dataDirectory?.findLocalData(createIfNotExists: createIfNotExists);
  }

  /// Finds the preference directory, returning
  /// "C:\Users\current\AppData\Roaming\directories-example\config" as a
  /// [Directory] object for example.
  Directory? findPreferenceDirectory({createIfNotExists = false}) {
    return _configurationDirectory?.findPreference(
        createIfNotExists: createIfNotExists);
  }

  /// Finds the data directory, returning
  /// "C:\Users\current\AppData\Roaming\directories-example\data" as a
  /// [Directory] object for example.
  Directory? findRoamingDataDirectory({createIfNotExists = false}) {
    return _dataDirectory?.findRoamingData(
        createIfNotExists: createIfNotExists);
  }

  /// Finds the local cache directory, returning
  /// "C:\Users\current\AppData\Local\directories-example" as a [Directory]
  /// object for example.
  Directory? findLocalCacheDirectory({createIfNotExists = false}) {
    return _cacheDirectory?.findLocal(createIfNotExists: createIfNotExists);
  }
}
