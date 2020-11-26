import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:segtocovid19/providers/conex_provider.dart';
import 'package:segtocovid19/ui/login/login_screen.dart';
import 'package:segtocovid19/ui/menu_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  ConnectionStatusSingleton connectionStatus = ConnectionStatusSingleton.getInstance();
  connectionStatus.initialize();

  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      theme: ThemeData(
          accentColor: Colors.white70
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  //necesario
  SharedPreferences sharedPreferences;

  @override
  void initState() {
    checkLoginStatus();
    super.initState();
  }
  //revisa el estado si tiene algun tokin
  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginScreen()), (Route<dynamic> route) => false);
    }else{
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => Menu()), (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    //esta sirve para prohibir la orientacion del sistema
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    //color de los iconos de la bar
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.black
    ));
    return Scaffold(
      backgroundColor: Color(0xffE8E2EE),
      body: Center(
          child: Image.asset(
            'images/Logo_UPP.png',
            height: size.width *.5,
          ),
      ),
    );
  }
}

/**import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:segtocovid19/ui/login/login_screen.dart';
import 'package:segtocovid19/ui/menu_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    //esta sirve para prohibir la orientacion del sistema
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    //color de los iconos de la bar
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.black
    ));
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}
 **/
/**
import 'package:flutter/material.dart';
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

**/