import 'dart:async';
import 'package:flutter/material.dart';
import 'package:segtocovid19/clases/datasymptom.dart';
import 'package:segtocovid19/controllers/databasehelper_sgto.dart';
import 'package:segtocovid19/ui/NavigationComponents/home/iconSymptoms.dart';
import 'package:segtocovid19/ui/NavigationComponents/segto/detalles_ui/detalles_screen.dart';


class SymtomsMolestiasWidget extends StatefulWidget{
  @override
  _SymtomsMolestiasWidgetState createState() => _SymtomsMolestiasWidgetState();
}

class _SymtomsMolestiasWidgetState extends State<SymtomsMolestiasWidget>{

  DataBaseHelperSgto _helperSgto = new DataBaseHelperSgto();
  String _registroT1='';
  String _registroT2='';
  String _registroT3='';
  String sintomas;
  bool vacio=true;
  var symptom;

  getDataLastThree () async {
    var safe = await _helperSgto.getThreeData("Molestias y dolores");

    if((safe).toString()!='{ok: true, data: []}'){
      Map<String, dynamic> map = safe;
      vacio=false;
      try{
        if(mounted) {
          setState(() {
            List<dynamic> data = map["data"];
            if(data.length==1){
              _registroT1=(data[0]["fechaHora"].toString()+'    '+data[0]["gravedad"].toString());
            }
            if(data.length==2){
              _registroT1=(data[0]["fechaHora"].toString()+'    '+data[0]["gravedad"].toString());
              _registroT2=(data[1]["fechaHora"].toString()+'    '+data[1]["gravedad"].toString());
            }
            if(data.length==3){
              _registroT1=(data[0]["fechaHora"].toString()+'    '+data[0]["gravedad"].toString());
              _registroT2=(data[1]["fechaHora"].toString()+'    '+data[1]["gravedad"].toString());
              _registroT3=(data[2]["fechaHora"].toString()+"    "+data[2]["gravedad"].toString());
            }
          });
        }
      }catch(e){
        print(e);
      }
    }
  }

  @override
  void initState() {
    this.getDataLastThree();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return vacio == true ? new SizedBox(height: 0,width:0) : new Padding(
      //margen de espacio en blanco a la derecha e izquierda
      padding: const EdgeInsets.symmetric(horizontal: 20),
      //colum es para abajo
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 3),
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
                                  text: "Molestias y dolores \n\n",
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
                    SizedBox(
                      height: size.width *.025,
                    ),
                    RaisedButton(
                      color: Color(0xffF39F2D),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Text('Detalles',
                        style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            color: Colors.white
                        ),
                      ),
                      onPressed: (){
                        sintomas = 'Molestias y dolores';
                        symptom = new Symptom();
                        symptom.sintoma = sintomas;
                        scheduleMicrotask(() => Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsSymptomScreen(symptom))));
                      },
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