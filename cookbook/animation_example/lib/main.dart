import 'package:flutter/material.dart';
import 'page_route_transition.dart';
import 'physics_simulation.dart';
import 'properties_container.dart';
import 'fade_widget.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Navigator',
      home: FadeApp(title: 'Opacity Demo'),
    )
  );
}
