import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:segtocovid19/Others/toast_msg.dart';
import 'package:segtocovid19/providers/globals.dart' as globals;
import 'package:segtocovid19/ui/register/cancel_button.dart';
import 'package:segtocovid19/controllers/databasehelper_user.dart';

class PasswordChangeMe extends StatefulWidget {
  @override
  _PasswordChangeState createState() => _PasswordChangeState();
}

class _PasswordChangeState extends State<PasswordChangeMe> {
  String _mat,_mail, _name, _mid, _last, _typeUs;
  ToasMSG _toast = new ToasMSG();
  DataBaseHelperUser _helperUser = new DataBaseHelperUser();
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  void initState() {
    _mat = globals.mat;
    _mail = globals.mail;
    _name = globals.name;
    _mid = globals.mid;
    _last = globals.last;
    _typeUs = globals.typeUs;
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
                  controller: _oldPasswordController,
                  maxLength: 50,
                  decoration: InputDecoration(
                    hintText: "Contraseña anterior",
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
                  controller: _newPasswordController,
                  maxLength: 50,
                  decoration: InputDecoration(
                    hintText: "Nueva contraseña",
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
                  controller: _confirmPasswordController,
                  maxLength: 50,
                  decoration: InputDecoration(
                    hintText: "Confirmar contraseña",
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
                    RaisedButton(
                      onPressed: (){
                        if(_oldPasswordController.text!='' || _confirmPasswordController.text!='' || _confirmPasswordController.text != ''){
                          if(_newPasswordController.text==_confirmPasswordController.text){
                            if(_oldPasswordController.text==_confirmPasswordController.text){
                              _toast.toastmsg("Tu contraseña parece seguir siendo las misma");
                            }else{
                              _helperUser.changePassUser(_mat, _oldPasswordController.text.trim(), _confirmPasswordController.text.trim(), _mail, _name, _mid, _last, _typeUs);
                            }
                          }else{
                            _toast.toastmsg("Las contraseñas no coinciden");
                          }
                        }else{
                          _toast.toastmsg("Llena los campos");
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
                            "Cambiar contraña",
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