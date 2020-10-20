import 'package:flutter/material.dart';
import 'package:segtocovid19/clases/datasymptom.dart';

class RegisterFamilyScren extends StatefulWidget {
  //final Symptom symptom;
  //AboutMe(this.symptom);
  @override
  _RegisterFamilyScrenState createState() => _RegisterFamilyScrenState();
}

class _RegisterFamilyScrenState extends State<RegisterFamilyScren> {
  //String sintoma;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _matriculaController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidoPController = TextEditingController();
  final TextEditingController _apellidoMController = TextEditingController();

  @override
  void initState(){
    super.initState();
    //sintoma = widget.symptom.sintoma;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var matricula;
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar familiar'),
        backgroundColor: Color(0xff3F005C),
      ),
      body: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              child: ListView(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 7),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                    decoration: BoxDecoration(
                      color: Color(0xffE8E2EE),
                      borderRadius: BorderRadius.circular(29.5),
                    ),
                    child: TextField(
                      controller: _matriculaController,
                      maxLength: 225,
                      decoration: InputDecoration(
                        hintText: "Parentesco",
                        counterText: '',
                        contentPadding: EdgeInsets.all(10.0),
                        hintStyle: TextStyle( color: Colors.black),
                        icon: Icon(Icons.bubble_chart),
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      //keyboard con okay
                      //keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true)
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 7),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                    decoration: BoxDecoration(
                      color: Color(0xffE8E2EE),
                      borderRadius: BorderRadius.circular(29.5),
                    ),
                    child: TextField(
                      controller: _nombreController,
                      maxLength: 225,
                      decoration: InputDecoration(
                        hintText: "Nombre",
                        counterText: '',
                        contentPadding: EdgeInsets.all(10.0),
                        hintStyle: TextStyle( color: Colors.black),
                        icon: Icon(Icons.email),
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      //keyboard con okay
                      //keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true)
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 7),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                    decoration: BoxDecoration(
                      color: Color(0xffE8E2EE),
                      borderRadius: BorderRadius.circular(29.5),
                    ),
                    child: TextField(
                      controller: _apellidoPController,
                      maxLength: 225,
                      decoration: InputDecoration(
                        hintText: "Apellido Paterno",
                        counterText: '',
                        contentPadding: EdgeInsets.all(10.0),
                        hintStyle: TextStyle( color: Colors.black),
                        icon: Icon(Icons.email),
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      //keyboard con okay
                      //keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true)
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 7),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                    decoration: BoxDecoration(
                      color: Color(0xffE8E2EE),
                      borderRadius: BorderRadius.circular(29.5),
                    ),
                    child: TextField(
                      controller: _apellidoMController,
                      maxLength: 225,
                      decoration: InputDecoration(
                        hintText: "Apellido Materno",
                        counterText: '',
                        contentPadding: EdgeInsets.all(10.0),
                        hintStyle: TextStyle( color: Colors.black),
                        icon: Icon(Icons.email),
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      //keyboard con okay
                      //keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true)
                    ),
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}