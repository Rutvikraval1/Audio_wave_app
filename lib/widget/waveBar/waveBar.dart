


import 'dart:math';

import 'package:flutter/material.dart';

class WaveVisualizer extends CustomPainter {
  final List<double> waveData;
  final double progress;
  final double dragPosition;

  WaveVisualizer({
    required this.waveData,
    required this.progress,
    required this.dragPosition,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final paintPlayed = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final paintUpcoming = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.fill;

    final barWidth = size.width / waveData.length;

    for (int i = 0; i < waveData.length; i++) {
      final x = i * barWidth;

      // Create a fish-like effect by modulating the bar height dynamically
      final fishAmplitude = waveData[i] * (1 + 0.2 * sin((i + progress * waveData.length) * 0.5));
      final height = fishAmplitude / 100 * size.height;
      final y = size.height - height;

      // Draw the bars
      if (i / waveData.length < progress) {
        canvas.drawRect(Rect.fromLTWH(x, y, barWidth - 2, height), paintPlayed);
      } else {
        canvas.drawRect(Rect.fromLTWH(x, y, barWidth - 2, height), paintUpcoming);
      }
    }

    // Draw draggable position indicator
    if (dragPosition > 0.0) {
      final dragX = dragPosition * size.width;
      final dragPaint = Paint()
        ..color = Colors.red
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.0;

      canvas.drawLine(
        Offset(dragX, 0),
        Offset(dragX, size.height),
        dragPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}