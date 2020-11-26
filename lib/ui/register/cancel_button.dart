import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:segtocovid19/ui/login/login_screen.dart';

class CancelButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 0, right: 2, left: 2, bottom: 20),
      alignment: Alignment.center,
      constraints: BoxConstraints(maxWidth: 400.0, minHeight: 40.0),
      child: FlatButton(
        color: Color(0xffFB8274),
        textColor: Colors.white,
        disabledColor: Colors.grey,
        splashColor: Color(0xff3F005C),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text("Cancelar",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: ResponsiveFlutter.of(context).fontSize(1.6),
            color: Colors.white,
          ),
        ),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }
}