import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:segtocovid19/ui/NavigationComponents/family/symtomsfamily_widget.dart';
class FamilyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.width *.025,
          ),
          Card(
            child: ListTile(
              leading: FlutterLogo(),
              title: Text('Agregar familiar'),
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
              title: Text('Administrar familiares'),
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
          SizedBox(
            height: size.width *.025,
          ),
          SymtomsFamilyWidget(),
        ],
      ),
    );
  }
}