import 'package:flutter/material.dart';
import 'package:segtocovid19/ui/NavigationComponents/segto/symtoms_widget.dart';

class SegtoScreen extends StatefulWidget {
  SegtoScreen({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _SegtoScreenPageState createState() => _SegtoScreenPageState();
}

class _SegtoScreenPageState extends State<SegtoScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body:   SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.width *.07,
            ),
            SymtomsWidget(),
            SymtomsWidget(),
            SymtomsWidget(),
            SymtomsWidget(),
            SymtomsWidget(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: new Icon(Icons.add, color: Colors.black,),
        backgroundColor: Color(0xffFFEDCF),
      ),
    );
  }
}

