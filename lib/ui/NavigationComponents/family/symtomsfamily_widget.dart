import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:segtocovid19/Others/constants.dart';
import 'package:segtocovid19/ui/NavigationComponents/family/details/detailssymptoms_screen.dart';
import 'package:segtocovid19/ui/NavigationComponents/home/iconSymptoms.dart';
import 'package:segtocovid19/controllers/databasehelper_sgtofamily.dart';

class SymtomsFamilyWidget extends StatefulWidget {
  @override
  _SymtomsFamilyWidgetState createState() => _SymtomsFamilyWidgetState();
}

class _SymtomsFamilyWidgetState extends State<SymtomsFamilyWidget> {

  DataBaseHelperSgtoFamily _helperSgtoFamily = new DataBaseHelperSgtoFamily();
  String _registro1='';
  String _registro2='';
  String _registro3='';
  String _registro4='';
  bool hola =false;

  getDataLastThree () async {
    var safe = await _helperSgtoFamily.getDataLastThree();
    if((safe).toString()!='{ok: true, data: []}'){
      try{
        Map<String, dynamic> map = safe;
        List<dynamic> data = map["data"];
        if(data.length==1){
          _registro1=(data[0]["nombreF"].toString()+' '+data[0]["apellidoF"].toString()+'\n'+data[0]["fechaHoraF"].toString()+' '+data[0]["sintomaF"].toString());
        }
        if(data.length==2){
          _registro1=(data[0]["nombreF"].toString()+' '+data[0]["apellidoF"].toString()+'\n'+data[0]["fechaHoraF"].toString()+' '+data[0]["sintomaF"].toString());
          _registro2=(data[1]["nombreF"].toString()+' '+data[1]["apellidoF"].toString()+'\n'+data[1]["fechaHoraF"].toString()+' '+data[1]["sintomaF"].toString());
        }
        if(data.length==3){
          _registro1=(data[0]["nombreF"].toString()+' '+data[0]["apellidoF"].toString()+'\n'+data[0]["fechaHoraF"].toString()+' '+data[0]["sintomaF"].toString());
          _registro2=(data[1]["nombreF"].toString()+' '+data[1]["apellidoF"].toString()+'\n'+data[1]["fechaHoraF"].toString()+' '+data[1]["sintomaF"].toString());
          _registro3=(data[2]["nombreF"].toString()+' '+data[2]["apellidoF"].toString()+'\n'+data[2]["fechaHoraF"].toString()+' '+data[2]["sintomaF"].toString());
        }
        if(data.length==4){
          _registro1=(data[0]["nombreF"].toString()+' '+data[0]["apellidoF"].toString()+'\n'+data[0]["fechaHoraF"].toString()+' '+data[0]["sintomaF"].toString());
          _registro2=(data[1]["nombreF"].toString()+' '+data[1]["apellidoF"].toString()+'\n'+data[1]["fechaHoraF"].toString()+' '+data[1]["sintomaF"].toString());
          _registro3=(data[2]["nombreF"].toString()+' '+data[2]["apellidoF"].toString()+'\n'+data[2]["fechaHoraF"].toString()+' '+data[2]["sintomaF"].toString());
          _registro4=(data[3]["nombreF"].toString()+' '+data[3]["apellidoF"].toString()+'\n'+data[3]["fechaHoraF"].toString()+' '+data[3]["sintomaF"].toString());
        }
        hola = true;
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
    return Padding(
      //margen de espacio en blanco a la derecha e izquierda
      padding: const EdgeInsets.symmetric(horizontal: 20),
      //colum es para abajo
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Historial de sintomas familiares",
            style: TextStyle(fontWeight: FontWeight.bold, color: kTextColor),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            width: double.infinity,
            //largo del cuadro contenedor
            height: 396,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFFF961F).withOpacity(0.7),
                    Color(0xFFC027F1).withOpacity(0.7),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                //row es de lado
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: size.width *.02,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: size.width *.1,
                          height: size.width*.195,
                          child: iconSymptoms(),
                        ),
                        SizedBox(
                          width: size.width *.03,
                        ),
                        new FutureBuilder(
                            future: getDataLastThree(),
                            builder: (context, snapshot) {
                              return hola==true ? new Expanded(
                                child: new RichText(
                                  text: new TextSpan(
                                    style: TextStyle(color: Colors.white),
                                    children: [
                                      new TextSpan(
                                        text: "Historial de sintomas familiares \n\n",
                                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),
                                      ),
                                      new TextSpan(
                                        text: _registro1+"\n",
                                        style: TextStyle(fontSize: ResponsiveFlutter.of(context).fontSize(1.7)),
                                      ),
                                      new TextSpan(text: '\n'),
                                      new TextSpan(
                                        text: _registro2+"\n",
                                        style: TextStyle(fontSize: ResponsiveFlutter.of(context).fontSize(1.7)),
                                      ),
                                      new TextSpan(text: '\n'),
                                      new TextSpan(
                                        text: _registro3+"\n",
                                        style: TextStyle(fontSize: ResponsiveFlutter.of(context).fontSize(1.7)),
                                      ),
                                      new TextSpan(text: '\n'),
                                      new TextSpan(
                                        text: _registro4,
                                        style: TextStyle(fontSize: ResponsiveFlutter.of(context).fontSize(1.7)),
                                      ),
                                    ],
                                  ),
                                ),
                              ): new Center(
                                child: new CircularProgressIndicator(),
                              );
                            }
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.width *.02,
                    ),
                    Row(
                        children: <Widget>[
                          SizedBox(
                            width: size.width *.12,
                          ),
                          SizedBox(
                            width: size.width *.35,
                            child: RaisedButton(
                              color: Color(0xffF39F2D),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)
                              ),
                              child: Text('Mostrar todo',
                                style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                    color: Colors.white
                                ),
                              ),
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FamilySymtomsAll(),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            width: size.width *.05,
                          ),
                          SizedBox(
                            width: size.width *.14,
                            child: RaisedButton(
                              padding: EdgeInsets.all(size.width *.016),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              color: Color(0xffFB8274),
                              onPressed: () {
                                getDataLastThree();
                              },
                              child: Icon(Icons.refresh, color: Colors.purple),
                            ),
                          ),
                        ],
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