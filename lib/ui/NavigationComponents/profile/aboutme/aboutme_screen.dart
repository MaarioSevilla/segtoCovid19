import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:segtocovid19/clases/user_class.dart';
import 'package:segtocovid19/controllers/databasehelper_user.dart';
import 'package:segtocovid19/ui/NavigationComponents/profile/aboutme/updateme_screen.dart';

class AboutMe extends StatefulWidget {
  @override
  _AboutMeState createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {

  DataBaseHelperUser _helperUser = new DataBaseHelperUser();
  bool hola =false;
  String nombre,apellido,correo,matricula;
  var user;

  loadDataUser() async {
    var safe = await _helperUser.getDataUser();
    if((safe).toString()!='{ok: true, data: []}'){
      try{
        Map<String, dynamic> map = safe;
        List<dynamic> data = map["data"];
        matricula=(data[0]["matricula"].toString());
        nombre=(data[0]["nombre"].toString());
        if(data[0]["apellidoII"].toString()!=null){
          apellido=(data[0]["apellido"].toString()+' '+data[0]["apellidoII"].toString());
        }else{
          apellido=(data[0]["apellido"].toString());
        }
        correo=(data[0]["email"].toString());
        hola = true;
      }catch(e){
        print(e);
      }
    }
  }

  //String sintoma;
  @override
  void initState(){
    this.loadDataUser();
    super.initState();
  }

  Color colore = Color.fromRGBO(58, 142, 155, 1);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffE8E2EE),
      body: Container(
        height: height,
        width: width,
        child: Stack(
          children: <Widget>[
            ListView(
                children: <Widget>[
                  SizedBox(
                    height: size.width *.06,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Image.asset(
                      'images/Logo_UPP.png',
                      height: 200,
                    ),
                  ),
                ],
            ),
            Positioned(
              child: Padding(
                padding: EdgeInsets.only(top: height / 15, left: 10),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0)),
                  height: 40,
                  width: 100,
                  child: Center(
                    child: FlatButton(
                      color: Color(0xffFB8274),
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      splashColor: Color(0xff3F005C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text("Volver",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: ResponsiveFlutter.of(context).fontSize(1.6),
                          color: Colors.white,
                        ),
                      ),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ),
              top: 0.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(height / 25),
                  height: height * 0.65,
                  width: width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50.0),
                          topRight: Radius.circular(50.0))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        'Tus Datos',
                        style: TextStyle(
                            fontSize: height / 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      new FutureBuilder(
                        future: loadDataUser(),
                        builder: (context, snapshot) {
                          return hola==true ? new Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              new Text("Matricula",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: height / 50)
                              ),
                              new Text(
                                matricula,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: height / 50),
                              ),
                              new SizedBox(
                                height: 13.0,
                              ),
                              new Text("Nombre(s)",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: height / 50)
                              ),
                              new Text(
                                nombre,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: height / 50),
                              ),
                              new SizedBox(
                                height: 13.0,
                              ),
                              new Text("Apellido(s)",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: height / 50)
                              ),
                              new Text(
                                apellido,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: height / 50),
                              ),
                              new SizedBox(
                                height: 13.0,
                              ),
                              new Text("Correo",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: height / 50)
                              ),
                              new Text(
                                correo,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: height / 50),
                              ),
                            ],
                          ): new Center(
                              child: new CircularProgressIndicator(),
                          );
                        }
                      ),
                      SizedBox(
                        height: size.width *.09,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                              width: size.width *.55,
                              child: RaisedButton(
                                padding: EdgeInsets.all(size.width *.026),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                color: Color(0xffFB8274),
                                onPressed: () async {
                                  user = new User();
                                  user.matricula = matricula;
                                  user.email = matricula;
                                  user.password = matricula;
                                  user.nombre = matricula;
                                  user.apellido = matricula;
                                  user.apellidoII = matricula;
                                  user.tipoUsuario = matricula;
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) => UpdateMe()
                                    ),
                                  );
                                },
                                child: Text(
                                  "Actualizar datos",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: height / 55),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: size.width *.25,
                              child: RaisedButton(
                                padding: EdgeInsets.all(size.width *.02),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                color: Color(0xffFB8274),
                                onPressed: () {
                                  loadDataUser();
                                },
                                child: Icon(Icons.refresh, color: Colors.orangeAccent),
                              ),
                            ),
                          ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}