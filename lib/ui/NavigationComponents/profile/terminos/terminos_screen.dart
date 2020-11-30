import 'package:flutter/material.dart';

class Terms extends StatelessWidget {

  Terms({Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Terminos y condiciones'),
        backgroundColor: Color(0xff3F005C),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.width *.025,
            ),
            Text('Al utilizar esta aplicacion aceptas los terminos y condiciones. Aceptas que la Universidad.'),
          ],
        ),
      ),
    );
  }
}