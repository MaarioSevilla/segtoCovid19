import 'dart:async';
import 'package:flutter/material.dart';
import 'package:segtocovid19/Others/constants.dart';
import 'package:segtocovid19/ui/NavigationComponents/segto/widgets_sgto/symptom_air_widget.dart';
import 'package:segtocovid19/ui/NavigationComponents/segto/widgets_sgto/symptom_bother_widget.dart';
import 'package:segtocovid19/ui/NavigationComponents/segto/widgets_sgto/symptom_chest_widget.dart';
import 'package:segtocovid19/ui/NavigationComponents/segto/widgets_sgto/symptom_conjuntivitis_widget.dart';
import 'package:segtocovid19/ui/NavigationComponents/segto/widgets_sgto/symptom_diarrea_widget.dart';
import 'package:segtocovid19/ui/NavigationComponents/segto/widgets_sgto/symptom_fever_widget.dart';
import 'package:segtocovid19/ui/NavigationComponents/segto/widgets_sgto/symptom_headache_widget.dart';
import 'package:segtocovid19/ui/NavigationComponents/segto/widgets_sgto/symptom_move_widget.dart';
import 'package:segtocovid19/ui/NavigationComponents/segto/widgets_sgto/symptom_pain_widget.dart';
import 'package:segtocovid19/ui/NavigationComponents/segto/widgets_sgto/symptom_rash_widget.dart';
import 'package:segtocovid19/ui/NavigationComponents/segto/widgets_sgto/symptom_smell_widget.dart';
import 'package:segtocovid19/ui/NavigationComponents/segto/widgets_sgto/symptom_tiredness_widget.dart';
import 'package:segtocovid19/ui/NavigationComponents/segto/widgets_sgto/symptom_tos_widget.dart';
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
            Text(
              "Historial de sintomas",
              style: TextStyle(fontWeight: FontWeight.bold, color: kTextColor),
            ),
            SizedBox(
              height: size.width*.03,
            ),
            SymtomsFeverWidget(),
            SymtomsTosWidget(),
            SymtomsAirWidget(),
            SymtomsCansancioWidget(),
            SymtomsMolestiasWidget(),
            SymtomsPainGargantaWidget(),
            SymtomsDiarreaWidget(),
            SymtomsConjuntivitisWidget(),
            SymtomsHeadacheWidget(),
            SymtomsSmellWidget(),
            SymtomsRashWidget(),
            SymtomsPechoWidget(),
            SymtomsMoveWidget(),
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

