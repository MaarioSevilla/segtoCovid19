import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:retry/retry.dart';
import 'package:segtocovid19/Others/constants.dart';
import 'package:segtocovid19/ui/NavigationComponents/home/iconTemperature.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:segtocovid19/controllers/databasehelper_temperature.dart';
import 'package:segtocovid19/providers/globals.dart' as globals;

class SummaryTemperature extends StatefulWidget {
  @override
  _SummaryTemperatureState createState() => _SummaryTemperatureState();
}


class _SummaryTemperatureState extends State<SummaryTemperature> {

  SharedPreferences sharedPreferences;
  DataBaseHelperTemperature _helperTemperature = new DataBaseHelperTemperature();
  static const serverUrl = globals.urlServer;
  List data;
  String _matricula;
  String _registroT1='';
  String _registroT2='';
  String _registroT3='';
  String _alert='';
  bool hola=false;


  Future getData() async {
    //obtencion de estado y matricula
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("matricula") == null) {
      print('no lo guarde');
    }else{
      _matricula=sharedPreferences.getString("matricula");
    }
    try{
      String myUrl = "$serverUrl/api/temperatura/showthreebymat/$_matricula";
      final r = RetryOptions(maxAttempts: 4);
      final response = await r.retry(
        // Make a GET request
            () => http.get(myUrl).timeout(Duration(seconds: 15)),
        // Retry on SocketException or TimeoutException
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );

      Map<String, dynamic> map = json.decode(response.body);

      if((map).toString()!='{ok: true, data: []}'){
        List<dynamic> data = map["data"];
        if(data.length==1){
          _registroT1=(data[0]["fecha"].toString()+'    '+data[0]["temperatura"].toString()+'° C\n');
        }
        if(data.length==2){
          _registroT1=(data[0]["fecha"].toString()+'    '+data[0]["temperatura"].toString()+'° C\n');
          _registroT2=(data[1]["fecha"].toString()+'    '+data[1]["temperatura"].toString()+'° C\n');
        }
        if(data.length==3){
          _registroT1=(data[0]["fecha"].toString()+'    '+data[0]["temperatura"].toString()+'° C\n');
          _registroT2=(data[1]["fecha"].toString()+'    '+data[1]["temperatura"].toString()+'° C\n');
          _registroT3=(data[2]["fecha"].toString()+"    "+data[2]["temperatura"].toString()+'° C\n');
        }
      }
      hola = true;
      //return json.decode(response.body);
    }on SocketException {
      print('No se pudo establecer conexion con el servidor 😑 temperature widget');
      hola=true;
    }on HttpException {
      print("Couldn't find the post 😱 temperature widget");
      hola=true;
    } on FormatException {
      print("Bad response format 👎 temperature widget");
      hola=true;
    }
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      //margen de espacio en blanco a la derecha e izquierda
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Historial de temperatura",
            style: TextStyle(fontWeight: FontWeight.bold, color: kTextColor),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            width: double.infinity,
            //largo del cuadro contenedor
            height: 166,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [
                    Color(0xff982CAD).withOpacity(0.9),
                    kPrimaryColor.withOpacity(0.7),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: size.width *.1,
                      height: size.width*.195,
                      child: iconTemperature(),
                    ),
                    SizedBox(
                      width: size.width *.04,
                    ),
                    Expanded(
                        child: new FutureBuilder(
                          future: getData(),
                          builder: (context, snapshot) {
                            return hola==true ? new RichText(
                                text: TextSpan(
                                  style: TextStyle(color: Colors.white),
                                  children: [
                                    TextSpan(
                                      text: "Historial de temperatura \n\n",
                                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),
                                    ),
                                    TextSpan(
                                      text: _registroT1,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    TextSpan(
                                      text: _registroT2,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    TextSpan(
                                      text: _registroT3,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    TextSpan(
                                      text: _alert,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                            )
                                : new Center(
                                    child: new CircularProgressIndicator(),
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
    );
  }
}