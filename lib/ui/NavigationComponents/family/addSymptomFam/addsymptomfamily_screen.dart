import 'package:flutter/material.dart';
import 'package:segtocovid19/ui/NavigationComponents/segto/optionsSymptom/components/registersymptomtitle.dart';
import 'package:segtocovid19/ui/NavigationComponents/segto/optionsSymptom/components/symptomsclick.dart';


class AddSymptomFamily extends StatelessWidget {

  AddSymptomFamily({Key key,}) : super(key: key);

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
            RegisterSymptomsTitle(),
            SymptomsClick(),
          ],
        ),
      ),
    );
  }
}