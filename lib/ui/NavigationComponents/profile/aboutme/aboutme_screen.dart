import 'package:flutter/material.dart';
import 'package:segtocovid19/clases/datasymptom.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AboutMe extends StatefulWidget {
  //final Symptom symptom;
  //AboutMe(this.symptom);
  @override
  _AboutMeState createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {

  SharedPreferences sharedPreferences;

  //String sintoma;
  @override
  void initState(){
    super.initState();
    checkLoginStatus();
    //sintoma = widget.symptom.sintoma;
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("matricula") == null) {
     print('no lo guardo');
    }else{
      print('si lo guarde');
      print(sharedPreferences.getString("matricula"));
    }
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