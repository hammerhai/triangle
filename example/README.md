# Triangle example

```dart
// Find in ./example/directories/bin/directories.dart
import 'package:triangle/triangle.dart';

void main() {
  TriangleProject project = TriangleProject("directories-example");
  print("Configuration: " + project.findConfigurationDirectory()!.path);
  print("Local cache: " + project.findLocalCacheDirectory()!.path);
  print("Local data: " + project.findLocalDataDirectory()!.path);
  print("Preference: " + project.findPreferenceDirectory()!.path);
  print("Roaming data: " + project.findRoamingDataDirectory()!.path);
}
```
