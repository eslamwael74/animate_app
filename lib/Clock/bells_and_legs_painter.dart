import 'package:flutter/material.dart';
import 'dart:math';

class BellsAndLegsPainter extends CustomPainter {
  final Paint bellPaint;
  final Paint legPaint;

  BellsAndLegsPainter()
      : bellPaint = new Paint(),
        legPaint = new Paint() {
    bellPaint.color = const Color(0xFF333333);
    bellPaint.style = PaintingStyle.fill;

    legPaint.color = const Color(0xFF555555);
    legPaint.style = PaintingStyle.stroke;
    legPaint.strokeWidth = 10.0;
    legPaint.strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    canvas.save();

    canvas.translate(radius, radius);

    drawHandle(radius, canvas);

    //rotate the canvas 30 degrees to the right
    canvas.rotate(2 * pi / 12);
    drawBellAndLeg(radius, canvas);

    //rotate back 60 degrees to the left
    canvas.rotate(-4 * pi / 12);
    drawBellAndLeg(radius, canvas);

    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }

  void drawBellAndLeg(double radius, Canvas canvas) {
    print("radius $radius");
    //bell
    Path pathBell = new Path();
    pathBell.moveTo(-55.0, -radius - 5);
    pathBell.lineTo(55.0, -radius - 5);
    pathBell.quadraticBezierTo(0.0, -radius - 75, -55.0, -radius - 10);

    //leg
    Path pathLeg = new Path();
    pathLeg.addOval(
        Rect.fromCircle(center: Offset(0.0, -radius - 50), radius: 3.0));
    pathLeg.moveTo(0.0, -radius - 50);
    pathLeg.lineTo(0.0, radius + 20);

    //draw the bell on top on the leg
    canvas.drawPath(pathLeg, legPaint);
    canvas.drawPath(pathBell, bellPaint);
  }

  void drawHandle(double radius, Canvas canvas) {
    //draw the handle
    Path path = new Path();
    path.moveTo(-60.0, -radius - 10);
    path.lineTo(-50.0, -radius - 50);
    path.lineTo(50.0, -radius - 50);
    path.lineTo(60.0, -radius - 10);

    canvas.drawPath(path, legPaint);
  }
}
