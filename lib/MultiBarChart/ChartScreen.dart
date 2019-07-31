import 'dart:math';

import 'package:animate_app/MultiBarChart/BarChart.dart';
import 'package:animate_app/MultiBarChart/BarChartPainter.dart';
import 'package:animate_app/MultiBarChart/BarChartTween.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';



class ChartScreen extends StatefulWidget {
  @override
  ChartPageState createState() => ChartPageState();
}

class ChartPageState extends State<ChartScreen> with TickerProviderStateMixin {
  static const size = const Size(200.0, 100.0);
  final random = Random();
  AnimationController animation;
  BarChartTween tween;

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    tween = BarChartTween(
      BarChart.empty(),
      BarChart.random(random),
    );
    animation.forward();
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  void changeData() {
    setState(() {
      tween = BarChartTween(
        tween.evaluate(animation),
        BarChart.random(random),
      );
      animation.forward(from: 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomPaint(
          size: size,
          painter: BarChartPainter(tween.animate(animation)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: changeData,
      ),
    );
  }
}