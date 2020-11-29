import 'package:segtocovid19/controllers/databasehelper_family.dart';
import 'package:segtocovid19/ui/NavigationComponents/family/RUD/update_familymember.dart';
import 'package:flutter/material.dart';

class FamilyMember extends StatefulWidget {

  List list;
  int index;
  FamilyMember({this.index,this.list});

  @override
  _FamilyMemberState createState() => _FamilyMemberState();
}

class _FamilyMemberState extends State<FamilyMember> {


  DataBaseHelperFamily databaseHelper = new DataBaseHelperFamily();

  //create function delete
  void confirm (){
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("Esta seguro de eliminar '${widget.list[widget.index]['nombreF']}'"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text("OK remove!",style: new TextStyle(color: Colors.white),),
          color: Colors.red,
          onPressed: (){
            databaseHelper.removeRegister(widget.list[widget.index]['idFamiliar'].toString());
            //notificacion y cambiar de pantalla
          },
        ),
        new RaisedButton(
          child: new Text("CANCELAR",style: new TextStyle(color: Colors.white)),
          color: Colors.green,
          onPressed: ()=> Navigator.pop(context),
        ),
      ],
    );

    showDialog(context: context, child: alertDialog);
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("${widget.list[widget.index]['nombreF']}"),
        backgroundColor: Color(0xff3F005C),
      ),
      body: new Container(
        height: 270.0,
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Padding(padding: const EdgeInsets.only(top: 30.0),),
                new Text(widget.list[widget.index]['nombreF'], style: new TextStyle(fontSize: 20.0),),
                Divider(),
                new Text("Apellidos : ${widget.list[widget.index]['apellidoF']} ${widget.list[widget.index]['apellidoFII']}\n", style: new TextStyle(fontSize: 18.0),),
                new Text("Parentesco : ${widget.list[widget.index]['parentesco']}", style: new TextStyle(fontSize: 18.0),),
                new Padding(padding: const EdgeInsets.only(top: 30.0),),

                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new RaisedButton(
                      child: new Text("Editar",style: TextStyle(color: Colors.white)),
                      color: Colors.purple,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      onPressed: ()=>Navigator.of(context).push(
                          new MaterialPageRoute(
                            builder: (BuildContext context)=>new UpdateFamilyMember(list: widget.list, index: widget.index,),
                          )
                      ),
                    ),
                    VerticalDivider(),
                    new RaisedButton(
                      child: new Text("Delete",style: TextStyle(color: Colors.white)),
                      color: Colors.redAccent,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      onPressed: ()=>confirm(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}