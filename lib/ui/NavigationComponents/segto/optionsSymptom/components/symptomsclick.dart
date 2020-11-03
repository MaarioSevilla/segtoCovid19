import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:segtocovid19/Others/constants.dart';
import 'package:segtocovid19/clases/datasymptom.dart';
import 'package:segtocovid19/ui/NavigationComponents/home/iconSymptoms.dart';
import 'package:segtocovid19/ui/NavigationComponents/segto/newSymptom/registesymptom_screen.dart';
import 'package:segtocovid19/ui/menu_screen.dart';

class SymptomsClick extends StatefulWidget{
  @override
  _SymptomsClickState createState() => _SymptomsClickState();
}

class _SymptomsClickState extends State<SymptomsClick>{
  String sintomas;
  String tos='tos';
  var symptom;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
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
            height: 796,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(29),
                color: const Color(0xffD9DFDF),
              ),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                //row es de lado
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: size.width *.05,
                    ),
                    Card(
                      child: ListTile(
                        title: Text('Tos seca'),
                        trailing: Icon(Ionicons.ios_arrow_forward),
                        onTap: () async {
                          sintomas = tos;
                          symptom = new Symptom();
                          symptom.sintoma = sintomas;
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => RegisterNewSymptom(symptom),
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
                              builder: (BuildContext context) => RegisterNewSymptom(symptom),
                            ),
                          );
                        },
                      ),
                    ),
                    CheckboxGroup(
                      labels: <String>[
                        "Tos seca",
                        "Cansancio",
                        "Molestias y dolores",
                        "Dolor de garganta",
                        "Diarrea",
                        "Conjuntivitis",
                        "Dolor de cabeza",
                        "Pérdida del sentido del olfato",
                        "Erupciones cutáneas",
                        "Dificultad para respirar",
                        "Dolor o presión en el pecho",
                        "Incapacidad para hablar o moverse",
                      ],
                      onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
                      onSelected: (List<String> checked) => print("checked: ${checked.toString()}"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}