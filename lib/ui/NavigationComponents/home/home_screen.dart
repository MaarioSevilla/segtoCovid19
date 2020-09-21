import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:segtocovid19/ui/NavigationComponents/home/summarysymptoms_widget.dart';
import 'package:segtocovid19/ui/NavigationComponents/home/summarytemperature_widget.dart';
import 'package:segtocovid19/ui/NavigationComponents/home/temperature_bar.dart';
import 'package:segtocovid19/ui/NavigationComponents/home/tempsave_button.dart';

class MyHomeScreenPage extends StatefulWidget {
  MyHomeScreenPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomeScreenPageState createState() => _MyHomeScreenPageState();
}

class _MyHomeScreenPageState extends State<MyHomeScreenPage> {

  String _timeString;

  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: 13),
          Container(
            margin: EdgeInsets.only(top: 10, left: 40, bottom: 30),
            height: 150,
            decoration: BoxDecoration(
              color: Color(0xffFFEDCF),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
            ),
            //aqui termina el diseno y comienza lo que contiene adentro
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
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: size.width *.07,
                    ),
                    SizedBox(
                      width: size.width *.5,
                      height: size.width*.2,
                      child: TemperatureBar(),
                    ),
                    SizedBox(
                      width: size.width *.04,
                    ),
                    SizedBox(
                      width: size.width *.25,
                      child: TemperatureButton(),
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
    );
  }
  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }
  String _formatDateTime(DateTime dateTime) {
    return DateFormat('MM/dd/yyyy hh:mm:ss').format(dateTime);
  }
}