import 'package:flutter/material.dart';

class DetailsSymptomScreen extends StatefulWidget {
  //final Symptom symptom;
  //RegisterNewSymptom(this.symptom);
  @override
  _DetailsSymptomScreenState createState() => _DetailsSymptomScreenState();
}

class _DetailsSymptomScreenState extends State<DetailsSymptomScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    String _registro1='11/09/20 08:04 p.m - Tos seca';
    String _registro2='11/09/20 08:04 p.m - Tos seca';
    String _registro3='11/09/20 08:04 p.m - Tos seca';
    return Scaffold(
        appBar: AppBar(
          title: Text('Detalles sintoma'),
          backgroundColor: Color(0xff3F005C),
          ),
        body: SingleChildScrollView(
            child: Column(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: "Historial de Sintomas \n\n",
                              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),
                            ),
                            TextSpan(
                              text: _registro1+"\n",
                              style: TextStyle(fontSize: 14),
                            ),
                            TextSpan(
                              text: _registro2+"\n",
                              style: TextStyle(fontSize: 14),
                            ),
                            TextSpan(
                              text: _registro3,
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                      ),
                    ),
                ],
            ),
        ),
    );
  }

}