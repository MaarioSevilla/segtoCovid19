import 'package:flutter/material.dart';
import 'package:segtocovid19/clases/datasymptom.dart';

class CrudEstudiantil extends StatefulWidget {
  //final Symptom symptom;
  //AboutMe(this.symptom);
  @override
  _CrudEstudiantilState createState() => _CrudEstudiantilState();
}

class _CrudEstudiantilState extends State<CrudEstudiantil> {
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
        title: Text('Mi circulo estudiantil'),
        backgroundColor: Color(0xff3F005C),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.width *.025,
            ),
            Text('Agregar grupo'),
            Text('Mis grupos'),
          ],
        ),
      ),
    );
  }
}