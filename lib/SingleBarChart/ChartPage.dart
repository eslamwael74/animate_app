import 'dart:math';
import 'dart:ui';

import 'package:animate_app/SingleBarChart/BarChartPainter.dart';
import 'package:flutter/material.dart';

class ChartPage extends StatefulWidget {
  @override
  ChartPageState createState() => ChartPageState();
}

class ChartPageState extends State<ChartPage> with TickerProviderStateMixin {
  final random = Random();
  int dataSet = 50;

  AnimationController animation;
  double startHeight; // Strike one.
  double currentHeight; // Strike two.
  double endHeight; // Strike three. Refactor.

  @override
  void initState() {
    super.initState();

    animation = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this)
      ..addStatusListener((AnimationStatus status) {
        switch (status) {
          case AnimationStatus.dismissed:
            setState(() {
              currentHeight =
                  lerpDouble(startHeight, endHeight, animation.value);
            });
            print(status);
            break;

          case AnimationStatus.forward:
            print(status);
            break;

          case AnimationStatus.reverse:
            print(status);
            break;

          case AnimationStatus.completed:
            break;
        }
      });
    startHeight = 0.0;
    currentHeight = 0.0;
    endHeight = dataSet.toDouble();
    animation.forward();
  }

  void changeData() {
    setState(() {
      startHeight = currentHeight; // Strike three. Refactor.
      dataSet = random.nextInt(100);
      endHeight = dataSet.toDouble();
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
            currentHeight,
            Color.fromARGB(random.nextInt(254), random.nextInt(254),
                random.nextInt(254), random.nextInt(254))),
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: changeData,
      ),
    );
  }
}
