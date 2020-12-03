import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:segtocovid19/providers/globals.dart' as globals;

class UnSeenNotificationPage extends StatefulWidget {
  @override
  _UnSeenNotificationPageScreenState createState() => _UnSeenNotificationPageScreenState();
}

class _UnSeenNotificationPageScreenState extends State<UnSeenNotificationPage> {

  static const serverUrl = globals.urlServer;
  List allUnSeenNotification = List();
  String _matricula;

  Future getUnSeenNotification()async{
    var url = "$serverUrl/api/notifications/info/$_matricula";
    var response = await http.get(url);
    if(response.statusCode == 200){
      var jsonData = json.decode(response.body);
      setState(() {
        allUnSeenNotification = jsonData;
      });
    }
    //print(allUnSeenNotification);
  }

  Future updateNotification(String id)async{
    var url = "$serverUrl/api/notifications/change/$id";
    var response = await http.post(url);
    if(response.statusCode ==200){
      print('ok');
    }
  }

  @override
  void initState() {
    _matricula=globals.matricula;
    super.initState();
    getUnSeenNotification();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notificaciones'),
        backgroundColor: Color(0xff3F005C),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView.builder(
            itemCount: allUnSeenNotification.length,
            itemBuilder: (context, index){
              var list = allUnSeenNotification[index];
              return Card(
                color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                child: ListTile(
                  title: Text(list['nombre']+' '+list['apellido']+' '+list['group']),
                  subtitle: new Text(
                    'Dio positivo el '+list['fechaPositivoCE'].toString(),
                  ),
                  trailing: IconButton(
                    icon: Text('Leido', style: TextStyle(color: Colors.white),),
                    onPressed: (){
                      updateNotification((list['idNoti']).toString()).whenComplete(() => getUnSeenNotification());
                    },
                  ),
                ),
              );
            }),
      ),

    );
  }
}