import 'dart:io';

import 'package:triangle/src/environment.dart';

export 'src/triangle_project.dart' show TriangleProject;

class Triangle {
  static Directory? get home => Environment.getHome();
}
