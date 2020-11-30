import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:segtocovid19/clases/user_class.dart';
import 'package:segtocovid19/ui/register/cancel_button.dart';
import 'package:segtocovid19/controllers/databasehelper_user.dart';
import 'change_password_screen.dart';
import 'package:segtocovid19/providers/globals.dart' as globals;

class UpdateMe extends StatefulWidget {
  final User user;
  UpdateMe(this.user);
  @override
  _UpdateMeState createState() => _UpdateMeState();
}

class _UpdateMeState extends State<UpdateMe> {

  DataBaseHelperUser _helperUser = new DataBaseHelperUser();
  TextEditingController _emailController;
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _matriculaController;
  TextEditingController _nombreController;
  TextEditingController _apellidoPController;
  TextEditingController _apellidoMController;

  String tipoUsuario="alumno";

  @override
  void initState() {
    _emailController = new TextEditingController(text: widget.user.email);
    _matriculaController = new TextEditingController(text: widget.user.matricula);
    _nombreController = new TextEditingController(text: widget.user.nombre);
    _apellidoPController = new TextEditingController(text: widget.user.apellido);
    _apellidoMController = new TextEditingController(text: widget.user.apellidoII);
    tipoUsuario = widget.user.tipoUsuario;
    globals.mat = widget.user.matricula;
    globals.mail = widget.user.email;
    globals.name = widget.user.nombre;
    globals.mid = widget.user.apellido;
    globals.last = widget.user.apellidoII;
    globals.typeUs = widget.user.tipoUsuario;
    super.initState();
  }

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    icon: Icon(Icons.lock),
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
                    icon: Icon(Icons.mail),
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
                    icon: Icon(Icons.person),
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
                  maxLength: 50,
                  decoration: InputDecoration(
                    hintText: "Introduzca su contraseña",
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
                      onPressed: (){
                        setState(() {
                          _helperUser.editaDataUser(_matriculaController.text.trim(), _passwordController.text.trim(), _emailController.text.trim(), _nombreController.text.trim(), _apellidoPController.text.trim(), _apellidoMController.text.trim(), tipoUsuario);
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
                            "Actualizar datos",
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
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (BuildContext context) => PasswordChangeMe()
                            ),
                          );
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
                            "Cambiar contraseña",
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

}