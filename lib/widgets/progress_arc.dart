import 'package:flutter/material.dart';
import 'dart:math';

import 'package:progress_arc/widgets/progress_arc_painter.dart';

class ProgressArc extends StatefulWidget {
  final double startAngle;
  final double partSizeInRadian;
  final double separatedDegree;
  final double completedPercent;
  final Color backgroundArcColor;
  final Color progressArcColor;
  final IconData icon;
  final double arcSize;

  const ProgressArc(
      {required this.startAngle,
      required this.partSizeInRadian,
      required this.separatedDegree,
      required this.completedPercent,
      required this.backgroundArcColor,
      required this.progressArcColor,
      required this.icon,
      required this.arcSize,
      Key? key})
      : super(key: key);

  @override
  State<ProgressArc> createState() => _ProgressArcState();
}

class _ProgressArcState extends State<ProgressArc>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5))
          ..addListener(() => setState(() {}));
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double iconPosition = widget.completedPercent *
        _animationController.value *
        (widget.partSizeInRadian - (widget.separatedDegree * (pi / 180)));
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.passthrough,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(widget.arcSize / 18.75),
          child: CustomPaint(
            size: Size(widget.arcSize, widget.arcSize),
            painter: ProgressArcPainter(
              startAngle: widget.startAngle,
              partSizeInRadian: widget.partSizeInRadian,
              separatedDegree: widget.separatedDegree,
              completedPercent:
                  widget.completedPercent * _animationController.value,
              backgroundArcColor: widget.backgroundArcColor,
              progressArcColor: widget.progressArcColor,
              arcSize: widget.arcSize,
            ),
          ),
        ),
        Positioned(
          left: (widget.arcSize / 2) +
              (widget.arcSize / 2 - (widget.arcSize / 30)) *
                  cos(iconPosition + widget.startAngle),
          top: (widget.arcSize / 2) +
              (widget.arcSize / 2 - (widget.arcSize / 30)) *
                  sin(iconPosition + widget.startAngle),
          child: CircleAvatar(
            backgroundColor: widget.progressArcColor,
            radius: (widget.arcSize / 18.75),
            child: Icon(
              widget.icon,
              size: widget.arcSize / 12.5,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
