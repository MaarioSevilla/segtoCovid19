import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:segtocovid19/ui/NavigationComponents/profile/crudestudiantil/newgroup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:segtocovid19/providers/globals.dart' as globals;
import 'package:segtocovid19/controllers/datbasehelper_circle.dart';

class CrudEstudiantil extends StatefulWidget {
  @override
  _CrudEstudiantilState createState() => _CrudEstudiantilState();
}

class _CrudEstudiantilState extends State<CrudEstudiantil> {
  //String sintoma;
  List<dynamic> datae;
  String _matricula;
  SharedPreferences sharedPreferences;
  static const serverUrl = globals.urlServer;
  DataBaseHelperCircle _helperCircle = new DataBaseHelperCircle();


  @override
  void initState(){
    this.getData();
    super.initState();
  }

  Future<List> getData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("matricula") == null) {
      print('no lo guardo');
    }else{
      _matricula=sharedPreferences.getString("matricula");
    }
    String myUrl = "$serverUrl/api/circulo/cebyid/$_matricula";
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
        title: Text('Mi circulo estudiantil'),
        backgroundColor: Color(0xff3F005C),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.width *.025,
            ),
            Container(
              margin: EdgeInsets.only(top: 0, right: 2, left: 2, bottom: 20),
              alignment: Alignment.center,
              constraints: BoxConstraints(maxWidth: 400.0, minHeight: 40.0),
              child: ButtonTheme(
                minWidth:  size.width *.8,
                //height: 100.0,
                child: FlatButton(
                color: Color(0xffFB8274),
                textColor: Colors.white,
                disabledColor: Colors.grey,
                splashColor: Color(0xff3F005C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Text("Agregar grupo",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ResponsiveFlutter.of(context).fontSize(1.6),
                    color: Colors.white,
                  ),
                ),
                onPressed: (){
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => new RegisterNewGroup(),
                    ),
                  );
                },
              ),
            ),
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
                          label: new Text(
                            'Mis grupos',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        new DataColumn(
                          label:new  Text(
                            'Eliminar',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                      rows: datae
                          .map((element)=> new DataRow(
                        cells: [
                          new DataCell(
                              new Text(element["idGrupo"]),
                            onTap: () {

                            },
                          ),
                          new DataCell(
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: (){
                                _helperCircle.removeRegister(element["id"].toString());
                                setState(() {
                                  getData();
                                });
                              },
                            ),
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