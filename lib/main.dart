import 'package:flutter/material.dart';
import 'package:segtocovid19/ui/NavigationComponents/home/home_screen.dart';
import 'package:segtocovid19/ui/login/login_screen.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:segtocovid19/ui/menu_screen.dart';

void main() => runApp(LoginApp());

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login PHP My Admin',
      home: new LoginPage(),
      routes: <String,WidgetBuilder>{
        '/Menu': (BuildContext context)=> new Menu(),
        '/LoginPage': (BuildContext context)=> new LoginPage(),
        //,'/bodegaPage': (BuildContext context)=> new BodegaPage(username: username,),
      },
    );
  }

}
String username='';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController matricula=new TextEditingController();
  TextEditingController pass=new TextEditingController();

  String msg='';
  //http.post("http://10.0.2.2/my_store/login.php"

  Future<List> _login() async {
    var datauser;
    String url = "http://192.168.100.30:8888/servicioMovil/post.php";
    try{
      final response = await http.post("http://192.168.100.30:8888/puente/login.php", body: {
        "matricula": matricula.text,
        "pass": pass.text,
      });

      datauser = json.decode(response.body);

      if(datauser.length==0){
        setState(() {
          msg="Login Fail";
        });
      }else{
        if(datauser[0]['tipoUsuario']=='alumno'){
          print('alumno encontrado');
          Navigator.pushReplacementNamed(context, '/Menu');
        }else if(datauser[0]['tipoUsuario']=='maestro'){
          Navigator.pushReplacementNamed(context, '/Menu');
        }
        setState(() {
          username= datauser[0]['matricula'];
        });
      }
    }catch (e) {
      print(e);
    }

    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"),),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text("Username",style: TextStyle(fontSize: 18.0),),
              TextField(
                controller: matricula,
                decoration: InputDecoration(
                    hintText: 'Username'
                ),
              ),
              Text("Password",style: TextStyle(fontSize: 18.0),),
              TextField(
                controller: pass,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Password'
                ),
              ),

              RaisedButton(
                child: Text("Login"),
                onPressed: (){
                  _login();
                },
              ),

              Text(msg,style: TextStyle(fontSize: 20.0,color: Colors.red),)
            ],
          ),
        ),
      ),
    );
  }
}

