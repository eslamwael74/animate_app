import 'dart:math';
import '../ColorPalette.dart';
import 'package:animate_app/MultiBarChart/Bar.dart';
import 'package:flutter/material.dart';

class BarChart {
  BarChart(this.bars);

  factory BarChart.empty(Size size) {
    return BarChart(<Bar>[]);
  }

  factory BarChart.random(Size size, Random random) {
    const barWidthFraction = 0.75;
    const minBarDistance = 20.0;
    final barCount = random.nextInt((size.width / minBarDistance).floor()) + 1;
    final barDistance = size.width / (1 + barCount);
    final barWidth = barDistance * barWidthFraction;
    final startX = barDistance - barWidth / 2;
    final color = ColorPalette.primary.random(random);
    final bars = List.generate(
      barCount,
          (i) => Bar(
        startX + i * barDistance,
        barWidth,
        random.nextDouble() * size.height,
        color,
      ),
    );
    return BarChart(bars);
  }

  final List<Bar> bars;

  static BarChart lerp(BarChart begin, BarChart end, double t) {
    final barCount = max(begin.bars.length, end.bars.length);
    final bars = List.generate(
      barCount,
          (i) => Bar.lerp(
        begin._barOrNull(i) ?? end.bars[i].collapsed,
        end._barOrNull(i) ?? begin.bars[i].collapsed,
        t,
      ),
    );
    return BarChart(bars);
  }

  Bar _barOrNull(int index) => (index < bars.length ? bars[index] : null);
}

