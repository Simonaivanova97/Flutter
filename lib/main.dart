import 'package:flutter/material.dart';
import 'package:progress_arc/widgets/circle_progress_arc.dart';

import 'entities/arc_component.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Progress Arc',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  //This data will become from backend
  final List<ArcComponent> arcComponent = [
    const ArcComponent(
      completedPercent: 0.9,
      progressColor: Colors.yellow,
      progressIcon: Icons.directions_run,
    ),
    const ArcComponent(
      completedPercent: 0.3,
      progressColor: Colors.orange,
      progressIcon: Icons.nightlight,
    ),
    const ArcComponent(
      completedPercent: 0.5,
      progressColor: Colors.red,
      progressIcon: Icons.lunch_dining,
    ),
  ];

  final List<ArcComponent> arcComponent1 = [
    const ArcComponent(
      completedPercent: 1.3,
      progressColor: Colors.yellow,
      progressIcon: Icons.directions_run,
    ),
  ];
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arc Progress'),
      ),
      body: Center(
        child: Column(
          children: [
            CircleProgressArc(
              arcComponents: arcComponent,
              arcSize: 200,
            ),
            CircleProgressArc(
              arcComponents: arcComponent1,
              arcSize: 200,
            ),
          ],
        ),
      ),
    );
  }
}
