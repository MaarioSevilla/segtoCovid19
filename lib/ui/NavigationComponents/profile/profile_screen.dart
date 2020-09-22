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
                    child: Text('Mis datos',
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
              leading: Icon(Ionicons.ios_clipboard),
              title: Text('Sobre mi'),
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
              leading: Icon(Ionicons.md_people),
              title: Text('Mi circulo estudiantil'),
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
              leading: Icon(Ionicons.ios_radio_button_off),
              title: Text('Resultado covid'),
              subtitle: Text('Negativo'),
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
        ],
      ),
    );
  }
}