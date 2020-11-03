import 'package:flutter/material.dart';
import 'package:segtocovid19/Others/constants.dart';
import 'package:segtocovid19/ui/NavigationComponents/home/iconSymptoms.dart';
import 'package:segtocovid19/ui/NavigationComponents/segto/symtomsdetails_button.dart';

class SymtomsWidget extends StatelessWidget {

  const SymtomsWidget({Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    String _registro1='11/09/20 08:04 p.m - Tos seca';
    String _registro2='11/09/20 08:04 p.m - Tos seca';
    String _registro3='11/09/20 08:04 p.m - Tos seca';
    return Padding(
      //margen de espacio en blanco a la derecha e izquierda
      padding: const EdgeInsets.symmetric(horizontal: 20),
      //colum es para abajo
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Historial de sintomas",
            style: TextStyle(fontWeight: FontWeight.bold, color: kTextColor),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            width: double.infinity,
            //largo del cuadro contenedor
            height: 196,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF982CAD).withOpacity(0.9),
                    Color(0xFF530085).withOpacity(0.7),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                //row es de lado
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: size.width *.025,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: size.width *.1,
                          height: size.width*.195,
                          child: iconSymptoms(),
                        ),
                        SizedBox(
                          width: size.width *.04,
                        ),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(color: Colors.white),
                              children: [
                                TextSpan(
                                  text: "Historial de Sintomas \n\n",
                                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),
                                ),
                                TextSpan(
                                  text: _registro1+"\n",
                                  style: TextStyle(fontSize: 14),
                                ),
                                TextSpan(
                                  text: _registro2+"\n",
                                  style: TextStyle(fontSize: 14),
                                ),
                                TextSpan(
                                  text: _registro3,
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.width *.025,
                    ),
                    SymptomsDetailsButton(),
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