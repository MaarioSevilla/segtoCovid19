import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class iconSymptoms extends StatelessWidget {
  const iconSymptoms({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xffFFF8EA),
        borderRadius: BorderRadius.circular(29.5),
      ),
      child: Icon(Ionicons.md_heart),
    );
  }
}