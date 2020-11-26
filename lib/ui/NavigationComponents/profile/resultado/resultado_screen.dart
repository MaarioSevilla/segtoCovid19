import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:segtocovid19/controllers/databasehelper_user.dart';

class ResultadoCovidScreen extends StatefulWidget {
  @override
  _ResultadoCovidScreenState createState() => _ResultadoCovidScreenState();
}

class _ResultadoCovidScreenState extends State<ResultadoCovidScreen> {

  var switchValue = true;
  bool hola =false;
  String matriculai,resultadoCovid,fechaPositivoCE,fechaNegativoCE;
  DataBaseHelperUser _helperUser = new DataBaseHelperUser();

  loadResultado()async{
    try{
      var safe = await _helperUser.getResulCovid();
      Map<String, dynamic> map = safe;
      List<dynamic> data = map["data"];
      matriculai=(data[0]["matriculai"].toString());
      resultadoCovid=(data[0]["resultadoCovid"].toString());
      fechaPositivoCE=(data[0]["fechaPositivoCE"].toString());
      fechaNegativoCE=(data[0]["fechaNegativoCE"].toString());
      hola = true;
    }catch(e){
      print(e);
    }
  }

  @override
  void initState(){
    this.loadResultado();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text("Animate Activity Indicator"),
                CupertinoSwitch(
                  value: switchValue,
                  onChanged: (changedValue) {
                    setState(() {
                      switchValue = changedValue;
                    });
                  },
                ),
              ],
            ),
            new FutureBuilder(
                future: loadResultado(),
                builder: (context, snapshot) {
                  return hola==true ? new Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      new Text("Matricula",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: height / 50)
                      ),
                      new Text(
                        matriculai,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: height / 50),
                      ),
                      new SizedBox(
                        height: 13.0,
                      ),
                      new Text("Nombre(s)",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: height / 50)
                      ),
                      new Text(
                        resultadoCovid,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: height / 50),
                      ),
                      new SizedBox(
                        height: 13.0,
                      ),
                      new Text("Apellido(s)",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: height / 50)
                      ),
                      new Text(
                        fechaPositivoCE,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: height / 50),
                      ),
                      new SizedBox(
                        height: 13.0,
                      ),
                      new Text("Correo",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: height / 50)
                      ),
                      new Text(
                        fechaNegativoCE,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: height / 50),
                      ),
                    ],
                  ): new Center(
                    child: new CircularProgressIndicator(),
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}