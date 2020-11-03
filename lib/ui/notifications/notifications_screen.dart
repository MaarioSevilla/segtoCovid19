import 'package:flutter/material.dart';
import 'package:segtocovid19/clases/datasymptom.dart';

class NotificationsScreen extends StatefulWidget {
  //final Symptom symptom;
  //AboutMe(this.symptom);
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  //String sintoma;
  @override
  void initState(){
    super.initState();
    //sintoma = widget.symptom.sintoma;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Notificaciones'),
        backgroundColor: Color(0xff3F005C),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.width *.025,
            ),
          ],
        ),
      ),
    );
  }
}