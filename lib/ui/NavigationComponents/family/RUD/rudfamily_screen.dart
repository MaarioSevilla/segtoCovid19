import 'package:flutter/material.dart';
import 'package:segtocovid19/clases/datasymptom.dart';

class RUDFamily extends StatefulWidget {
  //final Symptom symptom;
  //AboutMe(this.symptom);
  @override
  _RUDFamilyState createState() => _RUDFamilyState();
}

class _RUDFamilyState extends State<RUDFamily> {
  //String sintoma;
  @override
  void initState(){
    super.initState();
    //sintoma = widget.symptom.sintoma;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Administrar familiares'),
        backgroundColor: Color(0xff3F005C),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.width *.025,
            ),
          ],
        ),
      ),
    );
  }
}