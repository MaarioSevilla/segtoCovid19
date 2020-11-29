import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:segtocovid19/controllers/datbasehelper_circle.dart';

class RegisterNewGroup extends StatefulWidget {
  @override
  _RegisterNewGroupState createState() => _RegisterNewGroupState();
}

class _RegisterNewGroupState extends State<RegisterNewGroup> {

  DataBaseHelperCircle _helperCircle = new DataBaseHelperCircle();
  int _changedNumber = 0, _selectedNumber = 0;
  int _selectedIndex = 0;
  int _changedNumber2 = 0, _selectedNumber2 = 0;
  int _selectedIndex2 = 0;
  int _changedNumber3 = 0, _selectedNumber3 = 0;
  int _selectedIndex3 = 0;
  var switchValue = true;
  var sliderValue = 30.0;
  String firstp, _finalgrup;

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de grupos'),
        backgroundColor: Color(0xff3F005C),
      ),
      backgroundColor: Color(0xffE8E2EE),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.width *.025,
            ),
            SizedBox(
              height: size.width *.15,
            ),
            Container(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xffFFFFFF).withOpacity(0.7),
                      Color(0xffFFFFFF).withOpacity(0.7),
                    ],
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    CupertinoButton(
                        child: Text("Selecciona tu carrera :",
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF982CAD).withOpacity(0.9),
                          ),
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  height: size.width *.7,
                                  color: Colors.white,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      CupertinoButton(
                                        child: Text("Cancel"),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                      Expanded(
                                        child: CupertinoPicker(
                                            scrollController:
                                            new FixedExtentScrollController(
                                              initialItem: _selectedNumber,
                                            ),
                                            itemExtent: 32.0,
                                            backgroundColor: Colors.white,
                                            onSelectedItemChanged: (int index) {
                                              _selectedIndex = index;
                                            },
                                            children: new List<Widget>.generate(
                                                ingenierias.length, (int index) {
                                              return new Center(
                                                child: new Text(ingenierias[index]),
                                              );
                                            })
                                        ),
                                      ),
                                      CupertinoButton(
                                        child: Text("Ok"),
                                        onPressed: () {
                                          setState(() {
                                            _selectedNumber = _changedNumber;
                                          });
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                        }),
                    SizedBox(
                        width: size.width *.40,
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Text(
                            ingenierias[_selectedIndex],
                            style: TextStyle(fontSize: 17.0),
                          ),
                        ),
                    ),
                  ],
                ),
            ),
            SizedBox(
              height: size.width *.05,
            ),
            Container(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xffFFFFFF).withOpacity(0.7),
                      Color(0xffFFFFFF).withOpacity(0.7),
                    ],
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    CupertinoButton(
                        child: Text("Selecciona tu periodo actual :",
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF982CAD).withOpacity(0.9),
                          ),
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  height: size.width *.7,
                                  color: Colors.white,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      CupertinoButton(
                                        child: Text("Cancel"),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                      Expanded(
                                        child: CupertinoPicker(
                                            scrollController:
                                            new FixedExtentScrollController(
                                              initialItem: _selectedNumber2,
                                            ),
                                            itemExtent: 32.0,
                                            backgroundColor: Colors.white,
                                            onSelectedItemChanged: (int index2) {
                                              _selectedIndex2 = index2;
                                            },
                                            children: new List<Widget>.generate(
                                                number.length, (int index2) {
                                              return new Center(
                                                child: new Text(number[index2]),
                                              );
                                            })
                                        ),
                                      ),
                                      CupertinoButton(
                                        child: Text("Ok"),
                                        onPressed: () {
                                          setState(() {
                                            _selectedNumber2 = _changedNumber2;
                                          });
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                        }),
                    FittedBox(
                      child: Text(
                        number[_selectedIndex2],
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
            ),
            SizedBox(
              height: size.width *.05,
            ),
            Container(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(
                  colors: [
                    Color(0xffFFFFFF).withOpacity(0.7),
                    Color(0xffFFFFFF).withOpacity(0.7),
                  ],
                ),
              ),
              child: Row(
                children: <Widget>[
                  CupertinoButton(
                      child: Text("Selecciona tu numero de grupo :",
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF982CAD).withOpacity(0.9),
                        ),
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height: size.width *.7,
                                color: Colors.white,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    CupertinoButton(
                                      child: Text("Cancel"),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    Expanded(
                                      child: CupertinoPicker(
                                          scrollController:
                                          new FixedExtentScrollController(
                                            initialItem: _selectedNumber3,
                                          ),
                                          itemExtent: 32.0,
                                          backgroundColor: Colors.white,
                                          onSelectedItemChanged: (int index3) {
                                            _selectedIndex3 = index3;
                                          },
                                          children: new List<Widget>.generate(
                                              grupo.length, (int index3) {
                                            return new Center(
                                              child: new Text(grupo[index3]),
                                            );
                                          })
                                      ),
                                    ),
                                    CupertinoButton(
                                      child: Text("Ok"),
                                      onPressed: () {
                                        setState(() {
                                          _selectedNumber3 = _changedNumber3;
                                        });
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              );
                            });
                      }),
                  FittedBox(
                    child: Text(
                      grupo[_selectedIndex3],
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.width *.05,
            ),
            Container(
              margin: EdgeInsets.only(top: 0, right: 2, left: 2, bottom: 20),
              alignment: Alignment.center,
              constraints: BoxConstraints(maxWidth: 400.0, minHeight: 90.0),
              child: FlatButton(
                color: Color(0xffFB8274),
                textColor: Colors.white,
                disabledColor: Colors.grey,
                splashColor: Color(0xff3F005C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text("Guardar grupo",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ResponsiveFlutter.of(context).fontSize(1.6),
                    color: Colors.white,
                  ),
                ),
                onPressed: () async {
                  firstp = abreviacion(ingenierias[_selectedIndex]);
                  _finalgrup= (firstp+'0'+number[_selectedIndex2]+'_0'+grupo[_selectedIndex3]);
                  await _helperCircle.addData(_finalgrup);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const List<String> ingenierias = const <String>[
  'Lic. Médico Cirujano',
  'Lic. Terapia Física',
  'Ing. Biomédica',
  'Ing. Biotecnología',
  'Ing. Financiera',
  'Ing. Mecánica Automotriz',
  'Ing. Mecatrónica',
  'Ing. Redes y Telecomunicaciones',
  'Ing. Sistemas y Tecnologías Industriales',
  'Ing. Software',
  'Ing. Telemática',
  'Esp. Biotecnología Ambiental',
  'Esp. Mecatrónica',
  'Esp. Seguridad Informática',
  'Mtr. Biotecnología',
  'Mtr. Mecatrónica',
  'Mtr. TICs',
  'Mtr. Enseñanza de la ciencias',
  'Dr. Biotecnología',
  'Dr. Ciencias y Tecnologías...',
];

abreviacion(String carrera){
  String abr;
  if(carrera=='Lic. Médico Cirujano'){
    abr='Lic-Cir_';
  }else if(carrera=='Lic. Terapia Física'){
    abr='Lic-Ter_';
  }else if(carrera=='Ing. Biomédica'){
    abr='Ing-Biom_';
  }else if(carrera=='Ing. Biotecnología'){
    abr='Ing-Biot_';
  }else if(carrera=='Ing. Financiera'){
    abr='Ing-Fina_';
  }else if(carrera=='Ing. Mecánica Automotriz'){
    abr='Ing-Aut_';
  }else if(carrera=='Ing. Mecatrónica'){
    abr='Ing-Mect_';
  }else if(carrera=='Ing. Software'){
    abr='Ing-Soft_';
  }else if(carrera=='Ing. Telemática'){
    abr='Ing-Telm_';
  }else if(carrera=='Esp. Biotecnología Ambiental'){
    abr='Esp-BioA_';
  }else if(carrera=='Esp. Mecatrónica'){
    abr='Esp-Mect_';
  }else if(carrera=='Esp. Seguridad Informática'){
    abr='Esp-Seg_';
  }else if(carrera=='Mtr. Biotecnología'){
    abr='Mtr-Biot_';
  }else if(carrera=='Mtr. Mecatrónica'){
    abr='Mtr-Mect_';
  }else if(carrera=='Mtr. TICs'){
    abr='Mtr-Tics_';
  }else if(carrera=='Mtr. Enseñanza de la ciencias'){
    abr='Mtr-Ensc_';
  }else if(carrera=='Dr. Biotecnología'){
    abr='Dr-Biot_';
  }else if(carrera=='Dr. Ciencias y Tecnologías...'){
    abr='Dr-CyT_';
  }
  return abr;
}

const List<String> number = const <String>[
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
];

const List<String> grupo = const <String>[
  '1',
  '2',
  '3',
  '4',
];