import 'package:segtocovid19/controllers/databasehelper_family.dart';
import 'package:flutter/material.dart';


class UpdateFamilyMember extends StatefulWidget {

  final List list;
  final int index;

  UpdateFamilyMember({this.list, this.index});

  @override
  _UpdateFamilyMemberState createState() => _UpdateFamilyMemberState();
}

class _UpdateFamilyMemberState extends State<UpdateFamilyMember> {


  DataBaseHelperFamily databaseHelper = new DataBaseHelperFamily();

  TextEditingController parentescoController;
  TextEditingController nombreFController;
  TextEditingController apellidoFController;
  TextEditingController apellidoFIIController;
  TextEditingController idFMatriculaController;
  TextEditingController idFamiliarController;

  @override
  void initState() {
    idFamiliarController= new TextEditingController(text: widget.list[widget.index]['idFamiliar'].toString() );
    parentescoController= new TextEditingController(text: widget.list[widget.index]['parentesco'].toString() );
    nombreFController= new TextEditingController(text: widget.list[widget.index]['nombreF'].toString() );
    apellidoFController= new TextEditingController(text: widget.list[widget.index]['apellidoF'].toString() );
    apellidoFIIController= new TextEditingController(text: widget.list[widget.index]['apellidoFII'].toString() );
    idFMatriculaController= new TextEditingController(text: widget.list[widget.index]['idFMatricula'].toString() );
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Editar Familiar"),
        backgroundColor: Color(0xff3F005C),
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            new Column(
              children: <Widget>[
                new ListTile(
                  leading: const Icon(Icons.portrait, color: Colors.black),
                  title: new TextFormField(
                    controller: parentescoController,
                    validator: (value) {
                      if (value.isEmpty) return "Ingrese Parentesco";
                    },
                    decoration: new InputDecoration(
                      hintText: "Parentesco", labelText: "Parentesco",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.person, color: Colors.black),
                  title: new TextFormField(
                    controller: nombreFController,
                    validator: (value) {
                      if (value.isEmpty) return "Nombre";
                    },
                    decoration: new InputDecoration(
                      hintText: "Price", labelText: "Nombre",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.bubble_chart, color: Colors.black),
                  title: new TextFormField(
                    controller: apellidoFController,
                    validator: (value) {
                      if (value.isEmpty) return "Apellido paterno";
                    },
                    decoration: new InputDecoration(
                      hintText: "Stock", labelText: "Apellido paterno",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.bubble_chart, color: Colors.black),
                  title: new TextFormField(
                    controller: apellidoFIIController,
                    validator: (value) {
                      if (value.isEmpty) return "Apellido materno";
                    },
                    decoration: new InputDecoration(
                      hintText: "Stock", labelText: "Apellido materno",
                    ),
                  ),
                ),
                const Divider(
                  height: 1.0,
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      // Tres botones:
                      // LoginButton
                      new RaisedButton(
                        onPressed : () {
                          databaseHelper.editarData(
                              idFamiliarController.text.trim(),
                              parentescoController.text.trim(),
                              nombreFController.text.trim(),
                              apellidoFController.text.trim(),
                              apellidoFIIController.text.trim(),
                              idFMatriculaController.text.trim());
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        padding: EdgeInsets.all(0.0),
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [Color(0xff892BEF), Color(0xffDE149C)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,),
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Container(
                            constraints: BoxConstraints(maxWidth: 400.0, minHeight: 40.0),
                            alignment: Alignment.center,
                            child: Text(
                              "Guardar Cambios",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}