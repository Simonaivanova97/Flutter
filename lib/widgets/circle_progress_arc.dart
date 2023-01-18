import 'package:flutter/material.dart';
import 'package:progress_arc/entities/arc_component.dart';
import 'dart:math';

import 'package:progress_arc/widgets/progress_arc.dart';

class CircleProgressArc extends StatelessWidget {
  final List<ArcComponent> arcComponents;
  final double arcSize;

  const CircleProgressArc({
    required this.arcComponents,
    required this.arcSize,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double sizeOfArc = arcSize > MediaQuery.of(context).size.width ||
            arcSize > MediaQuery.of(context).size.height
        ? 200
        : arcSize;
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: List.generate(
          arcComponents.length,
          (index) => ProgressArc(
            startAngle: -pi / 2 + (index * 2 * pi / arcComponents.length),
            partSizeInRadian: 2 * pi / arcComponents.length,
            separatedDegree: arcComponents.length > 1 ? 15 : 0,
            completedPercent: arcComponents[index].completedPercent,
            backgroundArcColor: Colors.black26,
            progressArcColor: arcComponents[index].progressColor,
            icon: arcComponents[index].progressIcon,
            arcSize: sizeOfArc,
          ),
        ),
      ),
    );
  }
}
