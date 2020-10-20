import 'package:flutter/material.dart';
import '../../../menu_screen.dart';

class RegisterNewSymptomsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Color(0xffF39F2D),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
      ),
      child: Text('Guardar registro',
        style: new TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14.0,
            color: Colors.white
        ),
      ),
      onPressed: (){
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Menu()),
              (Route<dynamic> route) => false,
        );
        //Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => Menu()));
      },
    );
  }

}