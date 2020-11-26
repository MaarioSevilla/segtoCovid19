import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:segtocovid19/clases/datasymptom.dart';
import 'package:segtocovid19/ui/NavigationComponents/family/addSymptomFam/registersymtomfamily_screen.dart';

class OptionsSymptomFamily extends StatefulWidget{
  List list;
  int index;
  OptionsSymptomFamily({this.index,this.list});
  @override
  _OptionsSymptomFamilyState createState() => _OptionsSymptomFamilyState();
}

class _OptionsSymptomFamilyState extends State<OptionsSymptomFamily>{

  String sintomas;
  var symptom;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de sintomas F'),
        backgroundColor: Color(0xff3F005C),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.width *.025,
            ),
            Container(
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
                    child: Text("Que sintomas esta presentando '${widget.list[widget.index]['nombreF']}'?",
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13.0,
                        color: Color(0xffE6D9D0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              //margen de espacio en blanco a la derecha e izquierda
              padding: const EdgeInsets.symmetric(horizontal: 1),
              //colum es para abajo
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    //vertical altura que separa
                    margin: EdgeInsets.symmetric(vertical: 20),
                    width: double.infinity,
                    //largo del cuadro contenedor
                    height: 856,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: const Color(0xffE8E4EE),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        //row es de lado
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: size.width *.02,
                            ),
                            Card(
                              child: ListTile(
                                title: Text('Fiebre'),
                                trailing: Icon(Ionicons.ios_arrow_forward),
                                onTap: () async {
                                  sintomas = 'Fiebre';
                                  symptom = new Symptom();
                                  symptom.sintoma = sintomas;
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) => RegisterNewSymptomFamily(
                                        list: widget.list, index: widget.index, symptom: symptom,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Card(
                              child: ListTile(
                                title: Text('Tos seca'),
                                trailing: Icon(Ionicons.ios_arrow_forward),
                                onTap: () async {
                                  sintomas = 'Tos seca';
                                  symptom = new Symptom();
                                  symptom.sintoma = sintomas;
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) => RegisterNewSymptomFamily(
                                        list: widget.list, index: widget.index, symptom: symptom,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Card(
                              child: ListTile(
                                title: Text('Cansancio'),
                                trailing: Icon(Ionicons.ios_arrow_forward),
                                onTap: () async {
                                  sintomas = 'Cansancio';
                                  symptom = new Symptom();
                                  symptom.sintoma = sintomas;
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) => RegisterNewSymptomFamily(
                                        list: widget.list, index: widget.index, symptom: symptom,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Card(
                              child: ListTile(
                                title: Text('Molestias y dolores'),
                                trailing: Icon(Ionicons.ios_arrow_forward),
                                onTap: () async {
                                  sintomas = 'Molestias y dolores';
                                  symptom = new Symptom();
                                  symptom.sintoma = sintomas;
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) => RegisterNewSymptomFamily(
                                        list: widget.list, index: widget.index, symptom: symptom,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Card(
                              child: ListTile(
                                title: Text('Dolor de garganta'),
                                trailing: Icon(Ionicons.ios_arrow_forward),
                                onTap: () async {
                                  sintomas = 'Dolor de garganta';
                                  symptom = new Symptom();
                                  symptom.sintoma = sintomas;
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) => RegisterNewSymptomFamily(
                                        list: widget.list, index: widget.index, symptom: symptom,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Card(
                              child: ListTile(
                                title: Text('Diarrea'),
                                trailing: Icon(Ionicons.ios_arrow_forward),
                                onTap: () async {
                                  sintomas = 'Diarrea';
                                  symptom = new Symptom();
                                  symptom.sintoma = sintomas;
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) => RegisterNewSymptomFamily(
                                        list: widget.list, index: widget.index, symptom: symptom,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Card(
                              child: ListTile(
                                title: Text('Conjuntivitis'),
                                trailing: Icon(Ionicons.ios_arrow_forward),
                                onTap: () async {
                                  sintomas = 'Conjuntivitis';
                                  symptom = new Symptom();
                                  symptom.sintoma = sintomas;
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) => RegisterNewSymptomFamily(
                                        list: widget.list, index: widget.index, symptom: symptom,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Card(
                              child: ListTile(
                                title: Text('Dolor de cabeza'),
                                trailing: Icon(Ionicons.ios_arrow_forward),
                                onTap: () async {
                                  sintomas = 'Dolor de cabeza';
                                  symptom = new Symptom();
                                  symptom.sintoma = sintomas;
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) => RegisterNewSymptomFamily(
                                        list: widget.list, index: widget.index, symptom: symptom,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Card(
                              child: ListTile(
                                title: Text('Pérdida del sentido del olfato'),
                                trailing: Icon(Ionicons.ios_arrow_forward),
                                onTap: () async {
                                  sintomas = 'Pérdida del sentido del olfato';
                                  symptom = new Symptom();
                                  symptom.sintoma = sintomas;
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) => RegisterNewSymptomFamily(
                                        list: widget.list, index: widget.index, symptom: symptom,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Card(
                              child: ListTile(
                                title: Text('Erupciones cutáneas'),
                                trailing: Icon(Ionicons.ios_arrow_forward),
                                onTap: () async {
                                  sintomas = 'Erupciones cutáneas';
                                  symptom = new Symptom();
                                  symptom.sintoma = sintomas;
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) => RegisterNewSymptomFamily(
                                        list: widget.list, index: widget.index, symptom: symptom,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Card(
                              child: ListTile(
                                title: Text('Dificultad para respirar'),
                                trailing: Icon(Ionicons.ios_arrow_forward),
                                onTap: () async {
                                  sintomas = 'Dificultad para respirar';
                                  symptom = new Symptom();
                                  symptom.sintoma = sintomas;
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) => RegisterNewSymptomFamily(
                                        list: widget.list, index: widget.index, symptom: symptom,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Card(
                              child: ListTile(
                                title: Text('Dolor o presión en el pecho'),
                                trailing: Icon(Ionicons.ios_arrow_forward),
                                onTap: () async {
                                  sintomas = 'Dolor o presión en el pecho';
                                  symptom = new Symptom();
                                  symptom.sintoma = sintomas;
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) => RegisterNewSymptomFamily(
                                        list: widget.list, index: widget.index, symptom: symptom,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Card(
                              child: ListTile(
                                title: Text('Incapacidad para hablar o moverse'),
                                trailing: Icon(Ionicons.ios_arrow_forward),
                                onTap: () async {
                                  sintomas = 'Incapacidad para hablar o moverse';
                                  symptom = new Symptom();
                                  symptom.sintoma = sintomas;
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) => RegisterNewSymptomFamily(
                                        list: widget.list, index: widget.index, symptom: symptom,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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