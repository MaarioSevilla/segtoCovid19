import 'package:flutter/material.dart';
import 'package:segtocovid19/controllers/databasehelper_aire.dart';
import 'package:segtocovid19/controllers/databasehelper_sgto.dart';
import 'package:segtocovid19/controllers/databasehelper_tos.dart';
import 'package:segtocovid19/ui/NavigationComponents/segto/detalles_ui/update/details_update_screen.dart';
import 'package:segtocovid19/providers/globals.dart' as globals;

class ReadSymtom extends StatefulWidget {

  final List list;
  final int index;
  ReadSymtom({this.list, this.index});

  @override
  _ReadSymtomState createState() => _ReadSymtomState();

}

class _ReadSymtomState extends State<ReadSymtom> {

  DataBaseHelperSgto _helperSgto = new DataBaseHelperSgto();
  DataBaseHelperAir _helperAir = new DataBaseHelperAir();
  DataBaseHelperTos _helperTos = new DataBaseHelperTos();
  String sintoma;

  @override
  void initState() {
    sintoma=globals.sintomaG;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return new Scaffold(
      appBar: new AppBar(title: new Text("Detalles del sintoma"),
        backgroundColor: Color(0xff3F005C),
      ),
      backgroundColor: Color(0xffE8E2EE),
      body: Column(children: <Widget>[
        SizedBox(
          height: size.width *.3,
        ),
        new Container(
        height: 470.0,
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Padding(padding: const EdgeInsets.only(top: 30.0),),
                new Text('Sintoma $sintoma', style: new TextStyle(fontSize: 20.0),),
                Divider(),
                new Text("Gravedad : ${widget.list[widget.index]['gravedad']} ", style: new TextStyle(fontSize: 18.0),),
                new Text("Fecha y hora : ${widget.list[widget.index]['fechaHora']}", style: new TextStyle(fontSize: 18.0),),
                new Padding(padding: const EdgeInsets.only(top: 30.0),),

                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new RaisedButton(
                      child: new Text("Editar",style: TextStyle(color: Colors.white)),
                      color: Colors.purple,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      onPressed:() {
                        Navigator.of(context).push(
                            new MaterialPageRoute(
                              builder: (BuildContext context)=>new UpdateSymtom(list: widget.list, index: widget.index,),
                            )
                        );
                      },
                    ),
                    VerticalDivider(),
                    new RaisedButton(
                      child: new Text("Delete",style: TextStyle(color: Colors.white)),
                      color: Colors.redAccent,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      onPressed: (){
                        confirm();
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      ],),);
  }

  //create function delete
  void confirm (){
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("Esta seguto de eliminar '${widget.list[widget.index]['nombreF']}'"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text("OK remove!",style: new TextStyle(color: Colors.white),),
          color: Colors.red,
          onPressed: () {
            if(sintoma=="Tos seca"){
              print("table tos");
              _helperTos.removeRegister(widget.list[widget.index]['idSegtoTos'].toString());
            }else if(sintoma=="Dificultad para respirar"){
              print("table aire");
              _helperAir.removeRegister(widget.list[widget.index]['idSegtoAire'].toString());
            }else{
              print("table sgto");
              _helperSgto.removeRegister(widget.list[widget.index]['idSgtoSintomas'].toString());
            }
            //notificacion y cambiar de pantalla
          },
        ),
        new RaisedButton(
          child: new Text("CANCEL",style: new TextStyle(color: Colors.white)),
          color: Colors.green,
          onPressed: ()=> Navigator.pop(context),
        ),
      ],
    );

    showDialog(context: context, child: alertDialog);
  }

}