import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:segtocovid19/clases/datasymptom.dart';
import 'package:segtocovid19/ui/NavigationComponents/segto/detalles_ui/updatefever/read_symptoms_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:segtocovid19/controllers/databasehelper_sgto.dart';

class DetailsFeverSymptomScreen extends StatefulWidget {
  final Symptom symptom;
  DetailsFeverSymptomScreen(this.symptom);
  @override
  _DetailsFeverSymptomScreenState createState() => _DetailsFeverSymptomScreenState();
}

class _DetailsFeverSymptomScreenState extends State<DetailsFeverSymptomScreen> {
  List data;
  String sintoma;
  SharedPreferences sharedPreferences;
  DataBaseHelperSgto _helperSgto = new DataBaseHelperSgto();

  Future<List> getData() async {
    List<dynamic> data;
    //print(response.body);
    Map<String, dynamic> map = await _helperSgto.getAllData(sintoma);
    try{
      data = map["data"];
    }catch(e){
      print(e);
    }
    return data;
  }

  @override
  void initState() {
    sintoma = widget.symptom.sintoma;
    this.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Detalles sintoma'),
        backgroundColor: Color(0xff3F005C),
      ),
      backgroundColor: Color(0xffE8E2EE),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print('errrrror $snapshot.error');
          return snapshot.hasData ? new ItemList(
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
          child: new RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            elevation: 0.0,
            onPressed: () {
              Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext context) => new ReadFever(
                      list: list,
                      index: i,
                    )),
              );
            },
            child: new Container(
              alignment: Alignment.center,
              height: 50.0,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new Container(
                        child: new Row(
                          children: <Widget>[
                            new Icon(
                              Ionicons.ios_thermometer,
                              size: 18.0,
                              color: Colors.purple,
                            ),
                            new Text(
                              list[i]['temperatura'].toString()+'° C',
                              style: TextStyle(
                                  color: Color(0xff616161),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  new Text(
                  list[i]['fecha'].toString(),
                    style: TextStyle(
                        color: Color(0xFF982CAD).withOpacity(0.9),
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                ],
              ),
            ),
            color: Colors.white,
          ),
        );
      },
    );
  }
}

