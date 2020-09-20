import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class TemperatureBar extends StatelessWidget {
  const TemperatureBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      decoration: BoxDecoration(
        color: Color(0xffFFF8EA),
        borderRadius: BorderRadius.circular(29.5),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Temperatura",
          hintStyle: TextStyle( color: Colors.black),
          icon: Icon(Ionicons.ios_thermometer),
          border: InputBorder.none,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}