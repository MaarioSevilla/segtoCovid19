import 'package:flutter/material.dart';

class TemperatureButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Color(0xffF39F2D),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
      ),
      child: Text('Guardar',
        style: new TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14.0,
            color: Colors.white
        ),
      ),
      onPressed: (){

      },
    );
  }

}