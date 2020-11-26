import 'package:flutter/material.dart';
import 'package:segtocovid19/Others/constants.dart';
import 'package:segtocovid19/ui/NavigationComponents/home/iconSymptoms.dart';
import 'package:segtocovid19/ui/NavigationComponents/home/summarysymtoms_button.dart';
import 'package:segtocovid19/controllers/databasehelper_aire.dart';
import 'package:segtocovid19/controllers/databasehelper_tos.dart';
import 'package:segtocovid19/controllers/databasehelper_sgto.dart';

class SummarySymtoms extends StatefulWidget {
  @override
  _SummarySymtomsState createState() => _SummarySymtomsState();
}

class _SummarySymtomsState extends State<SummarySymtoms> {

  DataBaseHelperAir _helperAir = new DataBaseHelperAir();
  DataBaseHelperTos _helperTos = new DataBaseHelperTos();
  DataBaseHelperSgto _helperSgto = new DataBaseHelperSgto();

  String _registro1='';
  String _registro2='';
  String _registro3='';
  bool hola=false;


  getDataLastTos()async{
    var safe = await _helperTos.getDataLast();
    if((safe).toString()!='{ok: true, data: []}'){
      Map<String, dynamic> map = safe;
      try{
        List<dynamic> data = map["data"];
        _registro1=(data[0]["fechaHora"].toString()+' - Tos');
      }catch(e){
        print(e);
      }
    }
  }

  getDataLastAir()async{
    var safe = await _helperAir.getDataLast();
    if((safe).toString()!='{ok: true, data: []}'){
      Map<String, dynamic> map = safe;
      try{
        List<dynamic> data = map["data"];
        if(_registro1 == null){
          _registro1=(data[0]["fechaHora"].toString()+' - Falta de aire');
        }else{
          _registro2=(data[0]["fechaHora"].toString()+' - Falta de aire');
        }
      }catch(e){
        print(e);
      }
    }
  }

  getDataLastSgto()async{
    var safe = await _helperSgto.getDataLast();

    if((safe).toString()!='{ok: true, data: []}'){
      Map<String, dynamic> map = safe;
      try{
        List<dynamic> data = map["data"];
        if(_registro1 == null){
          _registro1=(data[0]["fechaHora"].toString()+' - '+data[0]["sintoma"].toString());
        }else if(_registro2 == null){
          _registro2=(data[0]["fechaHora"].toString()+' - '+data[0]["sintoma"].toString());
        }else{
          _registro3=(data[0]["fechaHora"].toString()+' - '+data[0]["sintoma"].toString());
        }
      }catch(e){
        print(e);
      }
    }
  }

  @override
  void initState() {
    this.getDataLastTos();
    this.getDataLastAir();
    this.getDataLastSgto();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
            height: 207,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF982CAD).withOpacity(0.9),
                    kPrimaryColor.withOpacity(0.7),
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
                      height: size.width *.01,
                    ),
                    SummarySymptomsButton(),
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