import 'package:animate_app/MultiBarChart/Bar.dart';
import 'package:flutter/material.dart';

class BarTween extends Tween<Bar> {
  BarTween(Bar begin, Bar end) : super(begin: begin, end: end);

  @override
  Bar lerp(double t) => Bar.lerp(begin, end, t);
}