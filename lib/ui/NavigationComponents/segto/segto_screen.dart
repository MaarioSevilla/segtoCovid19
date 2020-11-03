import 'dart:async';
import 'package:flutter/material.dart';
import 'package:segtocovid19/ui/NavigationComponents/segto/symtoms_widget.dart';

import 'optionsSymptom/optionsymptom_screen.dart';

class SegtoScreen extends StatefulWidget {
  SegtoScreen({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _SegtoScreenPageState createState() => _SegtoScreenPageState();
}

class _SegtoScreenPageState extends State<SegtoScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body:   SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.width *.07,
            ),
            SymtomsWidget(),
            SymtomsWidget(),
            SymtomsWidget(),
            SymtomsWidget(),
            SymtomsWidget(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => RegisterSymptom()));
          scheduleMicrotask(() => Navigator.of(context).push(MaterialPageRoute(builder: (context) => OptionsSymptom())));
        },
        child: new Icon(Icons.add, color: Colors.black,),
        backgroundColor: Color(0xffFFEDCF),
      ),
    );
  }
}

