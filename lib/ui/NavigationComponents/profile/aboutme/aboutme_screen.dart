import 'package:flutter/material.dart';
import 'package:segtocovid19/clases/datasymptom.dart';

class AboutMe extends StatefulWidget {
  //final Symptom symptom;
  //AboutMe(this.symptom);
  @override
  _AboutMeState createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
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
        title: Text('Sobre mi'),
        backgroundColor: Color(0xff3F005C),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.width *.025,
            ),
            Text('mis datos'),
            Text('nombre'),
            Text('Boton editar'),
            Text('Boton Cambiar contrasena'),
          ],
        ),
      ),
    );
  }
}