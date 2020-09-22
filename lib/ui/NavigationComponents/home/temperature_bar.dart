import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class TemperatureBar extends StatefulWidget {
  const TemperatureBar({
    Key key,
  }) : super(key: key);

  @override
  _TemperatureBarState createState() => _TemperatureBarState();
}

class _TemperatureBarState extends State<TemperatureBar> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap:(){
          FocusScope.of(context).unfocus();
        } ,
        //config: _buildConfig(context),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          decoration: BoxDecoration(
            color: Color(0xffFFF8EA),
            borderRadius: BorderRadius.circular(29.5),
          ),
          child: TextField(
            //focusNode: _nodeText1,
            decoration: InputDecoration(
              hintText: "Temperatura",
              hintStyle: TextStyle( color: Colors.black),
              icon: Icon(Ionicons.ios_thermometer),
              border: InputBorder.none,
            ),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            //keyboard con okay
            //keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true)
        ),
      ),
    );
  }
}