import 'package:flutter/material.dart';

import 'bells_and_legs_painter.dart';
import 'clock_face.dart';

class ClockApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clock',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Clock(),
    );
  }
}

class Clock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClockBody(),
          ],
        ),
      ),
    );
  }
}

class ClockBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AspectRatio(
      aspectRatio: 1.0,
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: CustomPaint(
              painter: BellsAndLegsPainter(),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
                boxShadow: [
                  BoxShadow(offset: Offset(0.0, 5.0), blurRadius: 5.0)
                ]),
            child: ClockFace(),
          )
        ],
      ),
    );
  }
}
