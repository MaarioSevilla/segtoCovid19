import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:segtocovid19/ui/NavigationComponents/family/family_screen.dart';
import 'package:segtocovid19/ui/NavigationComponents/home/home_screen.dart';
import 'package:segtocovid19/ui/NavigationComponents/profile/profile_screen.dart';
import 'package:segtocovid19/ui/NavigationComponents/segto/segto_screen.dart';

class Menu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MenuState();
  }
}

class _MenuState extends State<Menu> {

  int _currentIndex = 0;
  final List<Widget> _children = [
    MyHomeScreenPage(),
    SegtoScreen(),
    FamilyScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Segto Covid-19', style: TextStyle(
          color: Colors.white
        )),
        backgroundColor: Color(0xffAD43F7),
      ),
      body: _children[_currentIndex], // new
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xffD2A5F8),
        selectedItemColor: Color(0xff000000),
        unselectedItemColor: Color(0xff6B6966),
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