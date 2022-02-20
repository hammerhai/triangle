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

  test('Project.shiftDirectory() moves file from one directory to another',
      () async {
    // Assumes you're working in the root directory of Triangle
    String currentDirectory = Directory.current.path;
    Directory fromDirectory =
        Directory(p.join(currentDirectory, 'test', 'directories', 'unshifted'));
    File testFile = File(p.join(fromDirectory.path, 'shift.tri'));
    Directory toDirectory =
        Directory(p.join(currentDirectory, 'test', 'directories', 'shifted'));
    await testFile.create(recursive: true);
    await toDirectory.create(recursive: true);
    await project.shiftDirectory(fromDirectory.path, toDirectory.path);
    expect(toDirectory.listSync().length, greaterThanOrEqualTo(1));
    if (fromDirectory.existsSync() && toDirectory.existsSync()) {
      await fromDirectory.delete(recursive: true);
      await toDirectory.delete(recursive: true);
    }
  });
}
