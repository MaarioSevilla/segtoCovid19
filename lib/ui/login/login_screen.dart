import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:segtocovid19/ui/login/login_button.dart';
import 'package:segtocovid19/ui/register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                  height: size.width *.48,
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
                    icon: Icon(Icons.lock),
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
                    LoginButton(),
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
}