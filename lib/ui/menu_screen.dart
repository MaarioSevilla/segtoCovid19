import 'dart:convert';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:segtocovid19/ui/NavigationComponents/family/family_screen.dart';
import 'package:segtocovid19/ui/NavigationComponents/home/home_screen.dart';
import 'package:segtocovid19/ui/NavigationComponents/profile/profile_screen.dart';
import 'package:segtocovid19/ui/NavigationComponents/segto/segto_screen.dart';
import 'notifications/notifications_screen.dart';
import 'package:http/http.dart' as http;
import 'package:segtocovid19/providers/globals.dart' as globals;

class Menu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MenuState();
  }
}

class _MenuState extends State<Menu> {

  static const serverUrl = globals.urlServer;
  String _matricula='';
  int _currentIndex = 0;
  final List<Widget> _children = [
    MyHomeScreenPage(),
    SegtoScreen(),
    FamilyScreen(),
    ProfileScreen()
  ];

  bool resultado = false;
  var data='';

  Future getallDataNotoficaciones() async {
    var url = "$serverUrl/api/notifications/count/$_matricula";
    var response = await http.get(url);
    if(response.statusCode ==200){
      if(int.parse(response.body)>0){
        print(response.body);
        setState(() {
          resultado = true;
          data= response.body;
        });
      }
    }
    print('hola '+response.body);
    print(data);
  }

  @override
  void initState() {
    _matricula=globals.matricula;
    print('matricula notificaciones $_matricula');
    super.initState();
    getallDataNotoficaciones();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Segto Covid-19', style: TextStyle(
          color: Colors.white
        )),
        actions: <Widget>[
          resultado ?  //Esta es igual nombre de la columna de la bd donde se encuentran los datos que quieres que se reflejen en las notificaciones
          Padding(
            padding: const EdgeInsets.all(15),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>UnSeenNotificationPage(),),).whenComplete(() => getallDataNotoficaciones());
              },
              child: Badge(
                badgeContent: Text('$data', style: TextStyle(color: Colors.white),),
                child: Icon(Icons.notifications_active),
              ),
            ),
          )
              : Padding(
            padding: const EdgeInsets.all(15),
            child: InkWell(
              onTap: (){

              },
              child: Badge(
                badgeContent: Text('0', style: TextStyle(color: Colors.white)),
                child: Icon(Icons.notifications_none),
              ),
            ),
          ),

        ],
        backgroundColor: Color(0xff3F005C),
      ),
      body: _children[_currentIndex], // new
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff2D0078),
        selectedItemColor: Color(0xffE5D5CC),
        unselectedItemColor: Color(0xffA8A8AD),
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Ionicons.ios_heart_half),
            title: Text('Home'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Ionicons.ios_stats),
            title: Text('Seguimiento'),
          ),
          new BottomNavigationBarItem(
            icon:  Icon(Ionicons.ios_people),
            title: Text('Familiares'),
          ),
          new BottomNavigationBarItem(
              icon: Icon(Ionicons.ios_person),
              title: Text('Perfil')
          )
        ],
      ),
    );
  }
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

/**
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:segtocovid19/ui/menu_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';
  @override
  Widget build(BuildContext context) {
    //esta sirve para prohibir la orientacion del sistema
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    //color de los iconos de la bar
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.black
    ));
    return MaterialApp(
      title: _title,
      home: Menu(),
    );
  }
}**/
