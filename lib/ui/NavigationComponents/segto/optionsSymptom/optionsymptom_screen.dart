import 'package:flutter/material.dart';
import 'package:segtocovid19/ui/NavigationComponents/segto/optionsSymptom/components/registersymptomtitle.dart';
import 'components/symptomsclick.dart';

class OptionsSymptom extends StatelessWidget {

  OptionsSymptom({Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de sintomas'),
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