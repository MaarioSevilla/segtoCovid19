import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:segtocovid19/ui/NavigationComponents/home/temperature_bar.dart';
import 'package:segtocovid19/ui/NavigationComponents/home/tempsave_button.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEE d MMM').format(now);
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Text('Home'),
          Text(formattedDate),
          Container(
            margin: EdgeInsets.only(top: 10, left: 40, bottom: 30),
            height: 150,
            decoration: BoxDecoration(
              color: Color(0xffFFEDCF),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
            ),
            //aqui termina el diseno y comienza lo que contiene adentro
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 40,
                ),
                SizedBox(
                  width: size.width *.5,
                  height: size.width*.2,
                  child: TemperatureBar(),
                ),
                SizedBox(
                  width: 20,
                ),
                TemperatureButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}