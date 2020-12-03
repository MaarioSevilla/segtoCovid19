import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:segtocovid19/providers/globals.dart' as globals;
import 'package:segtocovid19/controllers/datbasehelper_circle.dart';

class ViewIfected extends StatefulWidget {
  @override
  _ViewIfectedState createState() => _ViewIfectedState();
}

class _ViewIfectedState extends State<ViewIfected> {

  List<dynamic> datae;
  SharedPreferences sharedPreferences;
  static const serverUrl = globals.urlServer;
  DataBaseHelperCircle _helperCircle = new DataBaseHelperCircle();
  String mygroup='';

  @override
  void initState(){
    mygroup = globals.group;
    this.getData();
    super.initState();
  }

  Future<List> getData() async {
    String myUrl = "$serverUrl/api/myig/$mygroup";
    try{
      final response = await http.get(myUrl);
      Map<String, dynamic> map = json.decode(response.body);
      datae = map["data"];
    }catch(e){
      print(e);
    }
    print('me ejecute');
    return datae;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Infectados $mygroup'),
        backgroundColor: Color(0xff3F005C),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.width *.025,
            ),
            new FutureBuilder<List>(
              future: this.getData(),
              builder: (ctx, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                return snapshot.hasData
                    ? new Center(
                  child: new SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: new DataTable(
                      columns: <DataColumn>[
                        new DataColumn(
                          label:new  Text(
                            'Nombre',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        new DataColumn(
                          label:new  Text(
                            'Apellido',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        new DataColumn(
                          label: new Text(
                            'Resultado',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                      rows: datae
                          .map((element)=> new DataRow(
                        cells: [
                          new DataCell(
                              new Text(element["nombre"]),
                            onTap: () {
                            },
                          ),
                          new DataCell(
                            new Text(element["apellido"]),
                            onTap: () {
                            },
                          ),
                          new DataCell(
                            new Text('Positivo'),
                            onTap: () {
                            },
                          ),
                        ],
                      )).toList(),
                    ),
                  ),
                )
                    : new Center(
                       child: new CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}