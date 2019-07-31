import 'package:flutter/material.dart';

class BarChartPainter extends CustomPainter {
  static const barWidth = 10.0;
  final double barHeight;
  final Color color;

  BarChartPainter(this.barHeight,this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.drawRect(
        Rect.fromLTWH((size.width - barWidth) / 2.0, (size.height - barHeight),
            barWidth, barHeight),
        paint);
  }

  @override
  bool shouldRepaint(BarChartPainter oldDelegate) =>
      barHeight != oldDelegate.barHeight;
}
