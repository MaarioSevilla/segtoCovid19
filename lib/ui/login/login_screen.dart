import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:segtocovid19/ui/menu_screen.dart';
import 'package:segtocovid19/ui/register/register_screen.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _matriculaController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool get isPopulated =>
      _matriculaController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool _isLoading = false;

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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: Color(0xffE8E2EE),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          child: ListView(
            children: <Widget>[
              Text('Covid-19',textAlign: TextAlign.center,),
              Text(
                'Seguimiento',
                textAlign: TextAlign.center,
                style: new TextStyle(
                    fontSize: ResponsiveFlutter.of(context).fontSize(2.2),
                    fontWeight: FontWeight.bold,
                    foreground: Paint()..shader = linearGradient),
              ),
              Text('Universidad Politecnica de Pachuca',textAlign: TextAlign.center,),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Image.asset(
                  'images/Logo_UPP.png',
                  height: 200,
                ),
              ),
              SizedBox(
                width: size.width *.5,
                height: size.width*.05,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
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
                    icon: Icon(Icons.lock),
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  //keyboard con okay
                  //keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true)
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
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
                    icon: Icon(Icons.vpn_key),
                    border: InputBorder.none,
                  ),
                  obscureText: true,
                  autocorrect: false,
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
                        onPressed : () {
                          if(_matriculaController.text == "" || _passwordController.text == ""){
                            print('esta vacio');
                          }else{
                            setState(() {
                              _isLoading = true;
                            });
                            signIn(_matriculaController.text, _passwordController.text);
                          }
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
                              "Iniciar Sesión",
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
              Container(
                margin: EdgeInsets.only(top: 0, right: 2, left: 2, bottom: 20),
                alignment: Alignment.center,
                constraints: BoxConstraints(maxWidth: 400.0, minHeight: 40.0),
                child: FlatButton(
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  splashColor: Color(0xff3F005C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text("Registrarse",
                    style: TextStyle(
                      fontSize: ResponsiveFlutter.of(context).fontSize(1.9),
                      color: Color(0xff3F005C),
                    ),
                  ),
                  onPressed: (){
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                          (Route<dynamic> route) => false,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///funcion singin
  signIn(String matricula, pass) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'matricula': matricula,
      'password': pass
    };
    var jsonResponse = null;
    var response = await http.post(
        "http://192.168.43.131:8000/api/login", body: data);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });
        sharedPreferences.setString("token", jsonResponse['token']);
        sharedPreferences.setString("matricula", matricula);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => Menu()), (
            Route<dynamic> route) => false);
      }
    }
    else {
      setState(() {
        _isLoading = false;
      });
      print(response.body);
    }
  }
}