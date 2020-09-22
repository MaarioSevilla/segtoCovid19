import 'package:flutter/material.dart';

class SummarySymptomsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Color(0xffF39F2D),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
      ),
      child: Text('Registrar sintoma',
        style: new TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14.0,
            color: Colors.white
        ),
      ),
      onPressed: (){
        print('hola');
      },
    );
  }

}