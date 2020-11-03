import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:segtocovid19/controllers/databasehelpers.dart';
import 'package:segtocovid19/ui/menu_screen.dart';
import 'package:segtocovid19/ui/register/cancel_button.dart';
import 'package:segtocovid19/ui/register/register_button.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisterScreenState();
  }
}

class _RegisterScreenState extends State<RegisterScreen> {

  DataBaseHelper databaseHelper = new DataBaseHelper();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _matriculaController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidoPController = TextEditingController();
  final TextEditingController _apellidoMController = TextEditingController();
  final String tipoUsuario="alumno";

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  @override
  void initState() {
    super.initState();
  }
//backgroundColor: Color(0xffF6F1F7),
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final Shader linearGradient = LinearGradient(
      colors: <Color>[Color(0xffDA44bb), Color(0xffFB243A)],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

    return Scaffold(
      backgroundColor: Color(0xffE8E2EE),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          child: ListView(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Column(
                      children: <Widget>[
                        Text('Covid-19',textAlign: TextAlign.end,),
                        Text('Seguimiento UPP',
                          style: new TextStyle(
                              fontSize: ResponsiveFlutter.of(context).fontSize(1.75),
                              fontWeight: FontWeight.bold,
                              foreground: Paint()..shader = linearGradient
                          ),
                        ),
                      ],
                  ),
                  SizedBox(
                    width: size.width *.33,
                  ),
                  SizedBox(
                    width: size.width *.25,
                    child: CancelButton(),
                  ),
                ],
              ),
              SizedBox(
                width: size.width *.5,
                height: size.width*.05,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Image.asset(
                  'images/Logo_UPP.png',
                  height: 90,
                ),
              ),
              SizedBox(
                width: size.width *.5,
                height: size.width*.05,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 7),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                decoration: BoxDecoration(
                  color: Color(0xffF9FAFB),
                  borderRadius: BorderRadius.circular(29.5),
                ),
                child: TextField(
                  controller: _matriculaController,
                  maxLength: 225,
                  decoration: InputDecoration(
                    hintText: "Matricula",
                    counterText: '',
                    contentPadding: EdgeInsets.all(10.0),
                    hintStyle: TextStyle( color: Colors.black),
                    icon: Icon(Icons.bubble_chart),
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  //keyboard con okay
                  //keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true)
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 7),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                decoration: BoxDecoration(
                  color: Color(0xffF9FAFB),
                  borderRadius: BorderRadius.circular(29.5),
                ),
                child: TextField(
                  controller: _passwordController,
                  maxLength: 225,
                  decoration: InputDecoration(
                    hintText: "Contraseña",
                    counterText: '',
                    contentPadding: EdgeInsets.all(10.0),
                    hintStyle: TextStyle( color: Colors.black),
                    icon: Icon(Icons.lock),
                    border: InputBorder.none,
                  ),
                  obscureText: true,
                  autocorrect: false,
                  //keyboard con okay
                  //keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true)
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 7),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                decoration: BoxDecoration(
                  color: Color(0xffF9FAFB),
                  borderRadius: BorderRadius.circular(29.5),
                ),
                child: TextField(
                  controller: _emailController,
                  maxLength: 225,
                  decoration: InputDecoration(
                    hintText: "Correo",
                    counterText: '',
                    contentPadding: EdgeInsets.all(10.0),
                    hintStyle: TextStyle( color: Colors.black),
                    icon: Icon(Icons.email),
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  //keyboard con okay
                  //keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true)
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 7),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                decoration: BoxDecoration(
                  color: Color(0xffF9FAFB),
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
                    icon: Icon(Icons.email),
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  //keyboard con okay
                  //keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true)
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 7),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                decoration: BoxDecoration(
                  color: Color(0xffF9FAFB),
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
                    icon: Icon(Icons.email),
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  //keyboard con okay
                  //keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true)
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 7),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                decoration: BoxDecoration(
                  color: Color(0xffF9FAFB),
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
                    icon: Icon(Icons.email),
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.emailAddress,
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
                        onPressed: (){
                          setState(() {
                            if(_emailController.text.trim().toLowerCase().isNotEmpty &&
                                _passwordController.text.trim().isNotEmpty ){
                              databaseHelper.registerUserData(
                                  _matriculaController.text.trim(),
                                  _emailController.text.trim().toLowerCase(),
                                  _passwordController.text.trim(),
                                  _nombreController.text.trim(),
                                  _apellidoPController.text.trim(),
                                  _apellidoMController.text.trim(),
                                  tipoUsuario).whenComplete((){
                                      if(databaseHelper.status){
                                        _showDialog();
                                        //msgStatus = 'Check email or password';
                                      }else{
                                        saveM(_matriculaController.text);
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(builder: (context) => Menu()),
                                              (Route<dynamic> route) => false,
                                        );
                                      }
                              });
                            }
                          });
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        padding: EdgeInsets.all(0.0),
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [Color(0xffFB635C), Color(0xffFB243A)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,),
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Container(
                            constraints: BoxConstraints(maxWidth: 400.0, minHeight: 40.0),
                            alignment: Alignment.center,
                            child: Text(
                              "Registrarse",
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
    );
  }

  void _showDialog(){
    showDialog(
        context:context ,
        builder:(BuildContext context){
          return AlertDialog(
            title: new Text('Failed'),
            content:  new Text('Check your email or password'),
            actions: <Widget>[
              new RaisedButton(
                child: new Text(
                  'Close',
                ),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
    );
  }

  //funcion guardar Matricula
  saveM(String matricula) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("matricula", matricula);
  }

}