import 'dart:ui';
import 'package:flutter/material.dart';

class Bar {
  Bar(this.x, this.width, this.height, this.color);

  final double x;
  final double width;
  final double height;
  final Color color;

  Bar get collapsed => Bar(x, 0.0, 0.0, color);

  static Bar lerp(Bar begin, Bar end, double t) {
    return Bar(
      lerpDouble(begin.x, end.x, t),
      lerpDouble(begin.width, end.width, t),
      lerpDouble(begin.height, end.height, t),
      Color.lerp(begin.color, end.color, t),
    );
  }
}
