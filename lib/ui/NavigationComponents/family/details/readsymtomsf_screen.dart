import 'package:flutter/material.dart';
import 'package:segtocovid19/controllers/databasehelper_sgtofamily.dart';
import 'package:segtocovid19/ui/NavigationComponents/family/details/updatesymtomf_screen.dart';

class ReadSymtomFamily extends StatefulWidget {

  final List list;
  final int index;
  ReadSymtomFamily({this.list, this.index});

  @override
  _ReadSymtomFamilyState createState() => _ReadSymtomFamilyState();

}

class _ReadSymtomFamilyState extends State<ReadSymtomFamily> {

  DataBaseHelperSgtoFamily _sgtoFamily = DataBaseHelperSgtoFamily();

  @override
  void initState() {
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
                  new Text('Sintoma ${widget.list[widget.index]['sintomaF']} ', style: new TextStyle(fontSize: 20.0),),
                  Divider(),
                  new Text("Gravedad : ${widget.list[widget.index]['gravedadF']} ", style: new TextStyle(fontSize: 18.0),),
                  new Text("Fecha y hora : ${widget.list[widget.index]['fechaHoraF']}", style: new TextStyle(fontSize: 18.0),),
                  new Text("Nota : ${widget.list[widget.index]['notaF']}", style: new TextStyle(fontSize: 18.0),),
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
                                builder: (BuildContext context)=> new UpdateSymtomFamily(list: widget.list, index: widget.index,),
                              )
                          );
                        },
                      ),
                      VerticalDivider(),
                      new RaisedButton(
                        child: new Text("Eliminar",style: TextStyle(color: Colors.white)),
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
            _sgtoFamily.removeRegister(widget.list[widget.index]['idSgtoF'].toString());
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