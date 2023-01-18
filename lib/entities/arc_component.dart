import 'package:flutter/material.dart';

class ArcComponent {
  final double completedPercent;
  final Color progressColor;
  final IconData progressIcon;

  const ArcComponent({
    required this.completedPercent,
    required this.progressColor,
    required this.progressIcon,
  });
}
