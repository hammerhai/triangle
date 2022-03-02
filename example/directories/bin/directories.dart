import 'package:triangle/triangle.dart';

void main() {
  TriangleProject project = TriangleProject("directories-example");

  String? _configuration = project.findConfigurationDirectory()?.path ?? "";
  String? _home = Triangle.home?.path ?? "";
  String? _localCache = project.findLocalCacheDirectory()?.path ?? "";
  String? _localData = project.findLocalDataDirectory()?.path ?? "";
  String? _preference = project.findPreferenceDirectory()?.path ?? "";
  String? _roamingData = project.findRoamingDataDirectory()?.path ?? "";

  print("Configuration: $_configuration");
  print("Home: $_home");
  print("Local cache: $_localCache");
  print("Local data: $_localData");
  print("Preference: $_preference");
  print("Roaming data: $_roamingData");
}
