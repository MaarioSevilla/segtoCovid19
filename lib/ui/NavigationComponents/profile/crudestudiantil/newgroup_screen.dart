import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:segtocovid19/controllers/datbasehelper_circle.dart';

class RegisterNewGroup extends StatefulWidget {
  @override
  _RegisterNewGroupState createState() => _RegisterNewGroupState();
}

class _RegisterNewGroupState extends State<RegisterNewGroup> {

  String _valueReal;
  int _value = 1;
  int _changedNumber = 0, _selectedNumber = 1;
  int _selectedIndex = 0;
  var switchValue = true;
  var sliderValue = 30.0;

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final Shader linearGradient = LinearGradient(
      colors: <Color>[Color(0xffDA44bb), Color(0xffFB243A)],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de grupos'),
        backgroundColor: Color(0xff3F005C),
      ),
      backgroundColor: Color(0xffE8E2EE),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.width *.025,
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 40, bottom: 10),
              height: 60,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF982CAD).withOpacity(0.9),
                    Color(0xFF530085).withOpacity(0.7),
                  ],
                ),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(height: size.width *.05),
                  SizedBox(
                    width: size.width *1,
                    child: Text("hola  sjndk sjnj",
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        fontSize: ResponsiveFlutter.of(context).fontSize(2),
                        fontWeight: FontWeight.bold,
                        color: Color(0xffFBFBFB),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.width *.05,
            ),
            Text('Seleciona tu carrera',
              style: new TextStyle(
                  fontSize: ResponsiveFlutter.of(context).fontSize(2.2),
                  fontWeight: FontWeight.bold,
                  foreground: Paint()..shader = linearGradient
              ),
            ),
            Text(
              "Cupertino Picker with Actions",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Row(
              children: <Widget>[
                CupertinoButton(
                    child: Text("Selecciona tu carrera :"),
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: size.width *.7,
                              color: Colors.white,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  CupertinoButton(
                                    child: Text("Cancel"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  Expanded(
                                    child: CupertinoPicker(
                                        scrollController:
                                        new FixedExtentScrollController(
                                          initialItem: _selectedNumber,
                                        ),
                                        itemExtent: 32.0,
                                        backgroundColor: Colors.white,
                                        onSelectedItemChanged: (int index) {
                                          _selectedIndex = index;
                                        },
                                        children: new List<Widget>.generate(
                                            colors.length, (int index) {
                                          return new Center(
                                            child: new Text(colors[index]),
                                          );
                                            })
                                    ),
                                  ),
                                  CupertinoButton(
                                    child: Text("Ok"),
                                    onPressed: () {
                                      setState(() {
                                        _selectedNumber = _changedNumber;
                                      });
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            );
                          });
                    }),
                Text(
                  colors[_selectedIndex],
                  style: TextStyle(fontSize: 18.0),
                ),SizedBox(
                  height: 20.0,
                ),
              ],
            ),
            Text(
              "Cupertino Picker with Actions",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Row(
              children: <Widget>[
                CupertinoButton(
                    child: Text("Selecciona tu periodo actual :"),
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: size.width *.7,
                              color: Colors.white,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  CupertinoButton(
                                    child: Text("Cancel"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  Expanded(
                                    child: CupertinoPicker(
                                        scrollController:
                                        new FixedExtentScrollController(
                                          initialItem: _selectedNumber,
                                        ),
                                        itemExtent: 32.0,
                                        backgroundColor: Colors.white,
                                        onSelectedItemChanged: (int index) {
                                          _selectedIndex = index;
                                        },
                                        children: new List<Widget>.generate(
                                            colors.length, (int index) {
                                          return new Center(
                                            child: new Text(colors[index]),
                                          );
                                        })
                                    ),
                                  ),
                                  CupertinoButton(
                                    child: Text("Ok"),
                                    onPressed: () {
                                      setState(() {
                                        _selectedNumber = _changedNumber;
                                      });
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            );
                          });
                    }),
                Text(
                  colors[_selectedIndex],
                  style: TextStyle(fontSize: 18.0),
                ),SizedBox(
                  height: 20.0,
                ),
              ],
            ),
            Text(
              "Cupertino Picker with Actions",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Row(
              children: <Widget>[
                CupertinoButton(
                    child: Text("Selecciona tu numero de grupo :"),
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: size.width *.7,
                              color: Colors.white,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  CupertinoButton(
                                    child: Text("Cancel"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  Expanded(
                                    child: CupertinoPicker(
                                        scrollController:
                                        new FixedExtentScrollController(
                                          initialItem: _selectedNumber,
                                        ),
                                        itemExtent: 32.0,
                                        backgroundColor: Colors.white,
                                        onSelectedItemChanged: (int index) {
                                          _selectedIndex = index;
                                        },
                                        children: new List<Widget>.generate(
                                            colors.length, (int index) {
                                          return new Center(
                                            child: new Text(colors[index]),
                                          );
                                        })
                                    ),
                                  ),
                                  CupertinoButton(
                                    child: Text("Ok"),
                                    onPressed: () {
                                      setState(() {
                                        _selectedNumber = _changedNumber;
                                      });
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            );
                          });
                    }),
                Text(
                  colors[_selectedIndex],
                  style: TextStyle(fontSize: 18.0),
                ),SizedBox(
                  height: 20.0,
                ),
              ],
            ),
            Text(
              "Alias de grupo generado",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(
              height: size.width *.05,
            ),
            Container(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(
                  colors: [
                    Color(0xffFFFFFF).withOpacity(0.7),
                    Color(0xffFFFFFF).withOpacity(0.7),
                  ],
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: _value,
                  items: [
                    DropdownMenuItem(
                      child: Text('Software',
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF982CAD).withOpacity(0.9),
                        ),
                      ),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text("Leve",
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF982CAD).withOpacity(0.9),
                        ),
                      ),
                      value: 2,
                    ),
                    DropdownMenuItem(
                        child: Text("Moderada",
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF982CAD).withOpacity(0.9),
                          ),
                        ),
                        value: 3
                    ),
                    DropdownMenuItem(
                        child: Text("Grave",
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF982CAD).withOpacity(0.9),
                          ),
                        ),
                        value: 4
                    )
                  ],
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                      print(_value);
                    });
                  },
                  isExpanded: true,
                ),
              ),
            ),
            SizedBox(
              height: size.width *.05,
            ),
            Container(
              margin: EdgeInsets.only(top: 0, right: 2, left: 2, bottom: 20),
              alignment: Alignment.center,
              constraints: BoxConstraints(maxWidth: 400.0, minHeight: 90.0),
              child: FlatButton(
                color: Color(0xffFB8274),
                textColor: Colors.white,
                disabledColor: Colors.grey,
                splashColor: Color(0xff3F005C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text("Guardar grupo",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ResponsiveFlutter.of(context).fontSize(1.6),
                    color: Colors.white,
                  ),
                ),
                onPressed: () async {

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const List<String> colors = const <String>[
  'Red',
  'Yellow',
  'Amber',
  'Blue',
  'Black',
  'Pink',
  'Purple',
  'White',
  'Grey',
  'Green',
];