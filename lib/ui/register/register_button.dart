import 'package:flutter/material.dart';
import 'package:segtocovid19/ui/menu_screen.dart';

class RegisterButton extends StatelessWidget {
  final VoidCallback _onPressed;

  RegisterButton({Key key, VoidCallback onPressed})
      : _onPressed = onPressed,
        super(key: key);
//onPressed: _onPressed,
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: (){
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Menu()),
                (Route<dynamic> route) => false,
          );
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
        ));
  }
}