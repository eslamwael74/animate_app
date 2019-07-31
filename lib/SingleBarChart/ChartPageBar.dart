import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

import 'Bar.dart';

class ChartPageBar extends StatefulWidget {
  @override
  ChartPageState createState() => ChartPageState();
}

class ChartPageState extends State<ChartPageBar> with TickerProviderStateMixin {
  final random = Random();
  AnimationController animation;
  BarTween tween;

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    tween = BarTween(
        Bar(0.0, Colors.deepOrangeAccent), Bar(50.0, Colors.greenAccent));
    animation.forward();
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  void changeData() {
    setState(() {
      tween = BarTween(
        tween.evaluate(animation),
        Bar(random.nextDouble() * 100.0, Colors.amber),
      );
      animation.forward(from: 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomPaint(
          size: Size(200.0, 100.0),
          painter: BarChartPainter(
              tween.animate(animation),
              Color.fromARGB(random.nextInt(254), random.nextInt(254),
                  random.nextInt(254), random.nextInt(254))),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: changeData,
      ),
    );
  }
}
