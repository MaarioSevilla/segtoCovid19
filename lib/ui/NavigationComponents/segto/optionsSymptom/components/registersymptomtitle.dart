import 'package:flutter/material.dart';

class RegisterSymptomsTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 10, left: 40, bottom: 10),
      height: 50,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF982CAD).withOpacity(0.9),
            Color(0xFF530085).withOpacity(0.7),
          ],
        ),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: size.width *.045),
          SizedBox(
            width: size.width *1,
            child: Text('Que sintomas esta presentando?',
              textAlign: TextAlign.center,
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Color(0xffE6D9D0),
              ),
            ),
          ),
        ],
      ),
    );
  }

}