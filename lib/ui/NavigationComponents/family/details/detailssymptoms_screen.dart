import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:segtocovid19/ui/NavigationComponents/family/details/readsymtomsf_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:segtocovid19/providers/globals.dart' as globals;

class FamilySymtomsAll extends StatefulWidget {
  @override
  _FamilySymtomsAllState createState() => _FamilySymtomsAllState();
}

class _FamilySymtomsAllState extends State<FamilySymtomsAll> {

  List data;
  String _matricula;
  static const serverUrl = globals.urlServer;
  SharedPreferences sharedPreferences;

  Future<List> getData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("matricula") == null) {
      print('no lo guardo');
    }else{
      _matricula=sharedPreferences.getString("matricula");
    }
    final response = await http.get("$serverUrl/api/sgtofamily/myfamily/$_matricula");
    Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> data = map["data"];
    return data;
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Historial familiares"),
        backgroundColor: Color(0xff3F005C),
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ItemList(
            list: snapshot.data,
          )
              : new Center(
            child: new CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext context) => new ReadSymtomFamily(
                      list: list,
                      index: i,
                    )),
              );
            },
            child: new Container(
              margin: EdgeInsets.symmetric(vertical: 0),
              width: double.infinity,
              //largo del cuadro contenedor
              height: 102,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFFF961F).withOpacity(0.7),
                      Color(0xFFC027F1).withOpacity(0.7),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  //row es de lado
                  child: Column(
                    children: <Widget>[
                      new ListTile(
                        title: new Text(
                          list[i]['nombreF'].toString()+' '+list[i]['apellidoF'].toString()+'     Parentesco: '+list[i]['parentesco'].toString(),
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0, color: Colors.white),
                        ),
                        subtitle: new Text(
                          list[i]['fechaHoraF'].toString()+' '+list[i]['sintomaF'].toString(),
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}