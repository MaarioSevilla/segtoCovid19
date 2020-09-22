import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
class ProfileScreen extends StatelessWidget {
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
              color: Color(0xffFFEDCF),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
            ),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 13),
                  SizedBox(
                    width: size.width *1,
                    child: Text('Sobre mi',
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ],
              ),
          ),
          Card(
            child: ListTile(
              leading: FlutterLogo(),
              title: Text('Mis datos'),
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
          Card(
            child: ListTile(
              leading: FlutterLogo(),
              title: Text('Mi circulo estudiantil'),
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
          Card(
            child: ListTile(
              leading: FlutterLogo(),
              title: Text('Resultado covid'),
              subtitle: Text('Negativo'),
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
          Container(
            margin: EdgeInsets.only(top: 10, left: 40, bottom: 10),
            height: 50,
            decoration: BoxDecoration(
              color: Color(0xffFFEDCF),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: 13),
                SizedBox(
                  width: size.width *1,
                  child: Text('Configuracion de la app',
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: ListTile(
              leading: FlutterLogo(),
              title: Text('Tema de la app'),
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
          Card(
            child: ListTile(
              leading: FlutterLogo(),
              title: Text('Lenguaje'),
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
          Card(
            child: ListTile(
              leading: FlutterLogo(),
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
        ],
      ),
    );
  }
}