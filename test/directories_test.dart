import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:test/test.dart';
import 'package:triangle/triangle.dart';

void main() {
  TriangleProject project = TriangleProject("directories-test");

  test('Project.findConfigurationDirectory() contains directories-test', () {
    String? configuration = project.findConfigurationDirectory()?.path;
    expect(configuration, contains(project.name));
  });

  test('Project.findLocalCacheDirectory() contains directories-test', () {
    String? localCache = project.findLocalCacheDirectory()?.path;
    expect(localCache, contains(project.name));
  });

  test('Project.findLocalDataDirectory() contains directories-test', () {
    String? localData = project.findLocalDataDirectory()?.path;
    expect(localData, contains(project.name));
  });

  test('Project.findPreferenceDirectory() contains directories-test', () {
    String? preference = project.findPreferenceDirectory()?.path;
    expect(preference, contains(project.name));
  });

  test('Project.findRoamingDataDirectory() contains directories-test', () {
    String? roamingData = project.findRoamingDataDirectory()?.path;
    expect(roamingData, contains(project.name));
  });
}
