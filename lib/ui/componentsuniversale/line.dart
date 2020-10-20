import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Colors.black,
      height: 20,
      thickness: 2,
      indent: 10,
      endIndent: 10,
    );
  }

}