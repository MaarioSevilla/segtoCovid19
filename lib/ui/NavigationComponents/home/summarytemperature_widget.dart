import 'package:flutter/material.dart';
import 'package:segtocovid19/Others/constants.dart';

class SummaryTemperature extends StatelessWidget {

  const SummaryTemperature({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _registroT1='11/09/20 08:04 p.m - 35 C';
    String _registroT2='11/09/20 08:04 p.m - 36 C';
    String _registroT3='11/09/20 08:04 p.m - 35 C';
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
                    Color(0xFFFF961F).withOpacity(0.7),
                    kPrimaryColor.withOpacity(0.7),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.white),
                          children: [
                            TextSpan(
                              text: "Historial de temperatura \n\n",
                              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),
                            ),
                            TextSpan(
                              text: _registroT1+"\n",
                              style: TextStyle(fontSize: 14),
                            ),
                            TextSpan(
                              text: _registroT2+"\n",
                              style: TextStyle(fontSize: 14),
                            ),
                            TextSpan(
                              text: _registroT3,
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
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