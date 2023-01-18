import 'package:flutter/material.dart';
import 'dart:math';

class ProgressArcPainter extends CustomPainter {
  final double startAngle;
  final double partSizeInRadian;
  final double separatedDegree;
  final double completedPercent;
  final Color backgroundArcColor;
  final Color progressArcColor;
  final double arcSize;

  const ProgressArcPainter({
    required this.startAngle,
    required this.partSizeInRadian,
    required this.separatedDegree,
    required this.completedPercent,
    required this.backgroundArcColor,
    required this.progressArcColor,
    required this.arcSize,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = backgroundArcColor
      ..strokeWidth = arcSize / 15
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2) - paint.strokeWidth / 2;

    //Draw background arc
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), startAngle,
        partSizeInRadian - (separatedDegree * (pi / 180)), false, paint);

    // Draw progress arc
    paint.color = progressArcColor;
    double completedRadians =
        (partSizeInRadian - (separatedDegree * (pi / 180))) * completedPercent;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), startAngle,
        completedRadians, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
