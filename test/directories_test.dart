import 'package:test/test.dart';
import 'package:triangle/triangle.dart';

void main() {
  TriangleProject project = TriangleProject('directories-test');

  test('Project.findConfigurationDirectory() is not empty or null', () {
    String? configuration = project.findConfigurationDirectory()?.path ?? '';
    expect(configuration, isNotEmpty);
  });

  test('Project.findLocalCacheDirectory() is not empty or null', () {
    String? localCache = project.findLocalCacheDirectory()?.path ?? '';
    expect(localCache, isNotEmpty);
  });

  test('Project.findLocalDataDirectory() is not empty or null', () {
    String? localData = project.findLocalDataDirectory()?.path ?? '';
    expect(localData, isNotEmpty);
  });

  test('Project.findPreferenceDirectory() is not empty or null', () {
    String? preference = project.findPreferenceDirectory()?.path ?? '';
    expect(preference, isNotEmpty);
  });

  test('Project.findRoamingDataDirectory() is not empty or null', () {
    String? roamingData = project.findRoamingDataDirectory()?.path ?? '';
    expect(roamingData, isNotEmpty);
  });
}
