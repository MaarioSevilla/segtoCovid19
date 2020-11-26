import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:segtocovid19/ui/NavigationComponents/family/RUD/rudfamily_screen.dart';
import 'package:segtocovid19/ui/NavigationComponents/family/addSymptomFam/familymembers_screen.dart';
import 'package:segtocovid19/ui/NavigationComponents/family/register/registerfamily_screen.dart';
import 'package:segtocovid19/ui/NavigationComponents/family/symtomsfamily_widget.dart';

class FamilyScreen extends StatefulWidget {
  @override
  _FamilyScreenState createState() => _FamilyScreenState();
}

class _FamilyScreenState extends State<FamilyScreen> {

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
              leading: Icon(Ionicons.ios_person_add),
              title: Text('Agregar familiar'),
              trailing: Icon(Ionicons.ios_arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterFamilyScren(),
                  ),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Ionicons.ios_body),
              title: Text('Administrar familiares'),
              trailing: Icon(Ionicons.ios_arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RUDFamily(),
                  ),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.add),
              title: Text('Agregar sintoma a familiar'),
              trailing: Icon(Ionicons.ios_arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FamilyMembersSelect(),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: size.width *.025,
          ),
          SymtomsFamilyWidget(),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}