import 'package:triangle/triangle.dart';

void main() {
  TriangleProject project = TriangleProject("directories-example");

  String? configuration = project.findConfigurationDirectory()?.path ?? "";
  String? home = Triangle.home.path;
  String? localCache = project.findLocalCacheDirectory()?.path ?? "";
  String? localData = project.findLocalDataDirectory()?.path ?? "";
  String? preference = project.findPreferenceDirectory()?.path ?? "";
  String? roamingData = project.findRoamingDataDirectory()?.path ?? "";

  print("Configuration: $configuration");
  print("Home: $home");
  print("Local cache: $localCache");
  print("Local data: $localData");
  print("Preference: $preference");
  print("Roaming data: $roamingData");
}
