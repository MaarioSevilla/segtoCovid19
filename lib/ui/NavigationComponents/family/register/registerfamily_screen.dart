import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:segtocovid19/controllers/databasehelper_family.dart';

class RegisterFamilyScren extends StatefulWidget {
  @override
  _RegisterFamilyScrenState createState() => _RegisterFamilyScrenState();
}

class _RegisterFamilyScrenState extends State<RegisterFamilyScren> {
  //String sintoma;
  DataBaseHelperFamily databaseHelper = new DataBaseHelperFamily();
  SharedPreferences sharedPreferences;
  final TextEditingController _parentescoController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidoPController = TextEditingController();
  final TextEditingController _apellidoMController = TextEditingController();
  String _matricula;

  @override
  void initState(){
    checkLoginStatus();
    super.initState();
    //sintoma = widget.symptom.sintoma;
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("matricula") == null) {
      print('no lo guardo');
    }else{
      print('si lo guarde');
      print(sharedPreferences.getString("matricula"));
      _matricula=sharedPreferences.getString("matricula");
      print(_matricula);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar familiar'),
        backgroundColor: Color(0xff3F005C),
      ),
      body: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              child: ListView(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 7),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                    decoration: BoxDecoration(
                      color: Color(0xffE8E2EE),
                      borderRadius: BorderRadius.circular(29.5),
                    ),
                    child: TextField(
                      controller: _parentescoController,
                      maxLength: 225,
                      decoration: InputDecoration(
                        hintText: "Parentesco",
                        counterText: '',
                        contentPadding: EdgeInsets.all(10.0),
                        hintStyle: TextStyle( color: Colors.black),
                        icon: Icon(Icons.perm_contact_calendar),
                        border: InputBorder.none,
                      ),
                      //keyboard con okay
                      //keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true)
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 7),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                    decoration: BoxDecoration(
                      color: Color(0xffE8E2EE),
                      borderRadius: BorderRadius.circular(29.5),
                    ),
                    child: TextField(
                      controller: _nombreController,
                      maxLength: 225,
                      decoration: InputDecoration(
                        hintText: "Nombre",
                        counterText: '',
                        contentPadding: EdgeInsets.all(10.0),
                        hintStyle: TextStyle( color: Colors.black),
                        icon: Icon(Icons.person),
                        border: InputBorder.none,
                      ),
                      //keyboard con okay
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 7),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                    decoration: BoxDecoration(
                      color: Color(0xffE8E2EE),
                      borderRadius: BorderRadius.circular(29.5),
                    ),
                    child: TextField(
                      controller: _apellidoPController,
                      maxLength: 225,
                      decoration: InputDecoration(
                        hintText: "Apellido Paterno",
                        counterText: '',
                        contentPadding: EdgeInsets.all(10.0),
                        hintStyle: TextStyle( color: Colors.black),
                        icon: Icon(Icons.bubble_chart),
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.text,
                      //keyboard con okay
                      //keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true)
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 7),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                    decoration: BoxDecoration(
                      color: Color(0xffE8E2EE),
                      borderRadius: BorderRadius.circular(29.5),
                    ),
                    child: TextField(
                      controller: _apellidoMController,
                      maxLength: 225,
                      decoration: InputDecoration(
                        hintText: "Apellido Materno",
                        counterText: '',
                        contentPadding: EdgeInsets.all(10.0),
                        hintStyle: TextStyle( color: Colors.black),
                        icon: Icon(Icons.bubble_chart),
                        border: InputBorder.none,
                      ),
                      //keyboard con okay
                      //keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true)
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        // Tres botones:
                        // LoginButton
                        RaisedButton(
                          onPressed : () async {
                            if(_parentescoController.text.isEmpty){
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('Alerta'),
                                  content: Text('Complete el parentesco!'),
                                ),
                              );
                            }else{
                              if(await databaseHelper.addFamilyMember( _parentescoController.text.trim(),_nombreController.text.trim(), _apellidoPController.text.trim(), _apellidoMController.text.trim(), _matricula) == true){
                                    print('lo registre exitosamente');
                                    _parentescoController.clear();
                                    _nombreController.clear();
                                    _apellidoPController.clear();
                                    _apellidoMController.clear();
                              }else{
                                    print('no se pudo completar el registro');
                              }
                              FocusScope.of(context).unfocus();
                            }
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
                                "Registrar familiar",
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
            ),
          ),
      ),
    );
  }
}