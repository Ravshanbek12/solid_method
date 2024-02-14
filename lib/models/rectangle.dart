import 'package:solid_method/models/shape.dart';

class Rectangle extends Shape {
  final int widthLeft;
  final int widthRight;
  final int heightLeft;
  final int heightRight;

  Rectangle({
    required this.widthLeft,
    required this.widthRight,
    required this.heightLeft,
    required this.heightRight,
  });

  @override
  void draw() {}

  @override
  void paint() {}

  void drawSquare() {}
}
