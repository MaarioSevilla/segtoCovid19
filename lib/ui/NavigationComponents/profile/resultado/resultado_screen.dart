import 'package:flutter/material.dart';
import 'package:segtocovid19/clases/datasymptom.dart';

class ResultadoCovidScreen extends StatefulWidget {
  //final Symptom symptom;
  //AboutMe(this.symptom);
  @override
  _ResultadoCovidScreenState createState() => _ResultadoCovidScreenState();
}

class _ResultadoCovidScreenState extends State<ResultadoCovidScreen> {
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
        title: Text('Mi resultado Covid-19'),
        backgroundColor: Color(0xff3F005C),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.width *.025,
            ),
            Text('resultado covid'),
            Text('fecha positivo'),
            Text('fecha negativo'),
            Text('boton guardar'),
          ],
        ),
      ),
    );
  }
}