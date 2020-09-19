import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:segtocovid19/ui/menu_screen.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Menu(),
    );
  }
}