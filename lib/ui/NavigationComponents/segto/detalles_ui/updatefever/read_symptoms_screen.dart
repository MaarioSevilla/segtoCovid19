import 'package:flutter/material.dart';
import 'package:segtocovid19/controllers/databasehelper_temperature.dart';
import 'package:segtocovid19/ui/NavigationComponents/segto/detalles_ui/updatefever/details_update_screen.dart';

class ReadFever extends StatefulWidget {

  final List list;
  final int index;
  ReadFever({this.list, this.index});

  @override
  _ReadFeverState createState() => _ReadFeverState();

}

class _ReadFeverState extends State<ReadFever> {

  DataBaseHelperTemperature _helperTemperature = new DataBaseHelperTemperature();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return new Scaffold(
      appBar: new AppBar(title: new Text("Detalles de temperatura"),
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
                new Text('Registro', style: new TextStyle(fontSize: 20.0),),
                Divider(),
                new Text("Temperatura : ${widget.list[widget.index]['temperatura']}° C", style: new TextStyle(fontSize: 18.0),),
                new Text("Fecha y hora : ${widget.list[widget.index]['fecha']}", style: new TextStyle(fontSize: 18.0),),
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
                              builder: (BuildContext context)=>new UpdateFever(list: widget.list, index: widget.index,),
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
      content: new Text("Esta seguro de eliminar el registro"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text("OK remove!",style: new TextStyle(color: Colors.white),),
          color: Colors.red,
          onPressed: () {
            _helperTemperature.removeRegister(widget.list[widget.index]['idSgtoTemp'].toString());
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