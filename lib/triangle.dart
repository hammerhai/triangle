import 'dart:io';

import 'package:triangle/src/environment.dart';

export 'src/triangle_project.dart' show TriangleProject;
export 'triangle.dart' show Triangle;

class Triangle {
  static Directory? get home => Environment.getHome();
}
