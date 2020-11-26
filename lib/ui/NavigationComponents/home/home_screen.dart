import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';
import 'package:segtocovid19/controllers/databasehelper_temperature.dart';
import 'package:segtocovid19/ui/NavigationComponents/home/summarysymptoms_widget.dart';
import 'package:segtocovid19/ui/NavigationComponents/home/summarytemperature_widget.dart';
import 'package:segtocovid19/Others/toast_msg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomeScreenPage extends StatefulWidget {
  MyHomeScreenPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomeScreenPageState createState() => _MyHomeScreenPageState();
}

class _MyHomeScreenPageState extends State<MyHomeScreenPage> {

  DataBaseHelperTemperature databaseHelper = new DataBaseHelperTemperature();
  ToasMSG _toast = new ToasMSG();
  SharedPreferences sharedPreferences;
  final TextEditingController _temperatureController = new TextEditingController();
  String _day, _month,_year, _hours,_second, _minute;
  String _timeString;
  String _timeStringDB;
  String _matricula;


  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    _timeStringDB = _formatDateTimeBD(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("matricula") == null) {
      print('no lo guardo');
    }else{
      print('si lo guarde');
      print(sharedPreferences.getString("matricula"));
      _matricula=sharedPreferences.getString("matricula");
      print(_matricula);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
        onTap:(){
          FocusScope.of(context).unfocus();
        } ,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 13),
              Container(
                margin: EdgeInsets.only(top: 10, left: 40, bottom: 30),
                height: 150,
                decoration: BoxDecoration(
                  color: Color(0xffE8E4EE),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
                ),
                //aqui termina el diseno y comienza lo que contiene adentro
                //column es para abajo
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10),
                    Text(_timeString),
                    SizedBox(height: 10),
                    Text('Guarda tu temperatura de hoy',
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                    //row es para la lados
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: size.width *.07,
                        ),
                        SizedBox(
                          width: size.width *.5,
                          height: size.width*.2,
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 20),
                            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                            decoration: BoxDecoration(
                              color: Color(0xffF9FAFB),
                              borderRadius: BorderRadius.circular(29.5),
                            ),
                            child: TextField(
                              controller: _temperatureController,
                              maxLength: 4,
                              decoration: InputDecoration(
                                hintText: "Temperatura",
                                counterText: '',
                                contentPadding: EdgeInsets.all(10.0),
                                hintStyle: TextStyle( color: Colors.black),
                                icon: Icon(
                                  Ionicons.ios_thermometer,
                                  color: Colors.purple,
                                ),
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.numberWithOptions(decimal: true),
                              //keyboard con okay
                              //keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true)
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width *.04,
                        ),
                        SizedBox(
                          width: size.width *.25,
                          child: RaisedButton(
                            color: Color(0xffFB8274),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)
                            ),
                            child: Text('Guardar',
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                  color: Colors.white
                              ),
                            ),
                            onPressed: () async {
                              if(_temperatureController.text.isEmpty){
                                _toast.toastmsg("Llena el campo");
                              }else if(  double.parse(_temperatureController.text)<30){
                                _toast.toastmsg("Valor debajo de los 30 grados");
                              }else if(double.parse(_temperatureController.text)>40){
                                _toast.toastmsg("Valor superior a los 40 grados");
                              }else{
                                if(await databaseHelper.addDataTemperatura(_matricula, _timeStringDB, _temperatureController.text.trim()) == true){
                                  print('lo registre exitosamente');
                                  _temperatureController.clear();
                                  _toast.toastmsg("Se ha registrado con exito");
                                }else{
                                  print('no se pudo completar el registro');
                                }
                                FocusScope.of(context).unfocus();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              SummaryTemperature(),
              SummarySymtoms(),
            ],
          ),
        )
    );
  }
  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    final String formattedDateTimeBD = _formatDateTimeBD(now);
    if(mounted) {
      setState(() {
        _timeString = formattedDateTime;
        _timeStringDB = formattedDateTimeBD;
      });
    }
  }
  String _formatDateTime(DateTime dateTime) {
    return DateFormat('MM/dd/yyyy hh:mm:ss').format(dateTime);
  }
  String _formatDateTimeBD(DateTime dateTime) {
    _year='${dateTime.year}';
    if(dateTime.month<10){
      _month='0${dateTime.month}';
    }else{
      _month='${dateTime.month}';
    }
    if(dateTime.day<10){
      _day='0${dateTime.day}';
    }else{
      _day='${dateTime.day}';
    }
    if(dateTime.hour<10){
      _hours='0${dateTime.hour}';
    }else{
      _hours='${dateTime.hour}';
    }
    if(dateTime.minute<10){
      _minute='0${dateTime.minute}';
    }else{
      _minute='${dateTime.minute}';
    }
    if(dateTime.second<10){
      _second='0${dateTime.second}';
    }else{
      _second='${dateTime.second}';
    }
    //print('${dateTime.year}-${dateTime.month}-${dateTime.day} ${dateTime.hour}:${dateTime.minute}:${dateTime.second}');
    return '$_year-$_month-$_day $_hours:$_minute:$_second';
  }
}