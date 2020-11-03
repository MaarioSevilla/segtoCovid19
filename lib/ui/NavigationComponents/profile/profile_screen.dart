import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:segtocovid19/ui/NavigationComponents/profile/resultado/resultado_screen.dart';
import 'package:segtocovid19/ui/componentsuniversale/line.dart';
import 'package:segtocovid19/ui/login/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'aboutme/aboutme_screen.dart';
import 'crudestudiantil/crudestudiantil_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.width *.025,
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 40, bottom: 10),
            height: 50,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF982CAD).withOpacity(0.9),
                  Color(0xFF530085).withOpacity(0.7),
                ],
              ),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
            ),
              child: Column(
                children: <Widget>[
                  SizedBox(height: size.width *.045),
                  SizedBox(
                    width: size.width *1,
                    child: Text('Mis datos',
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: Color(0xffE6D9D0),
                      ),
                    ),
                  ),
                  ],
              ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Ionicons.ios_clipboard),
              title: Text('Sobre mi'),
              trailing: Icon(Ionicons.ios_arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutMe(),
                  ),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Ionicons.md_people),
              title: Text('Mi circulo estudiantil'),
              trailing: Icon(Ionicons.ios_arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CrudEstudiantil(),
                  ),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Ionicons.ios_radio_button_off),
              title: Text('Resultado covid'),
              subtitle: Text('Negativo'),
              trailing: Icon(Ionicons.ios_arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultadoCovidScreen(),
                  ),
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 40, bottom: 10),
            height: 50,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF982CAD).withOpacity(0.9),
                  Color(0xFF530085).withOpacity(0.7),
                ],
              ),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height:  size.width *.045),
                SizedBox(
                  width: size.width *1,
                  child: Text('Configuracion de la app',
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Color(0xffE6D9D0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Ionicons.ios_contrast),
              title: Text('Tema de la app'),
              trailing: Icon(Ionicons.ios_arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    //builder: (context) => YourNewPage(),
                  ),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Ionicons.ios_build),
              title: Text('Lenguaje'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    //
                  ),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Ionicons.ios_document),
              title: Text('Terminos y condiciones'),
              trailing: Icon(Ionicons.ios_arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    //
                  ),
                );
              },
            ),
          ),
          Line(),
          Card(
            child: ListTile(
              leading: Icon(Ionicons.ios_log_out),
              title: Text('Cerrar sesón'),
              onTap: () {
                sharedPreferences.clear();
                sharedPreferences.commit();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
                        (Route<dynamic> route) => false);
              },
            ),
          ),
        ],
      ),
    );
  }
}