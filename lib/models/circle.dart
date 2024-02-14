import 'dart:math';

import 'package:solid_method/models/shape.dart';

class Circle extends Shape{
  final int radius;

  Circle({required this.radius});
  @override
  void draw() {
    radius*2*pi;
  }

  @override
  void paint() {
    radius*radius*pi;
  }

}