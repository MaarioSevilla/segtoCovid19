import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
void main() => runApp(MaterialApp(home: MyApp(),));
class MyApp extends StatelessWidget{
  prueba createState()=> prueba();
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cliente ligero"),
      ),
      body: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  prueba createState() => prueba();
}
class prueba  extends State<MyHomePage>
{
  String url = "http://192.168.100.30:8888/servicioMovil/post.php";
  String Gurl = "http://192.168.100.30:8888/servicioMovil/getParametros.php?pedir";
  String urlS = "http://192.168.100.30:8888/servicioMovil/sinParametros.php";
  String respuestaSring;
  String respuestaGet;
  String respuestaSinParametros;

  Future<String> obtenerDatosPost() async{
    var respuesta = await http.post(url,body: {"pedir":"data"});
    print(respuesta.body);
    setState(() {
      respuestaSring = (respuesta.body).toString();
    });
  }
  Future<String> obtenerDatosGet() async{
    var respuestaG = await http.get(Gurl);
    print(respuestaG.body);
    setState(() {
      respuestaGet = (respuestaG.body).toString();
    });
  }
  Future<String> obtenerDatosSinParametros() async{
    var respuestaS = await http.get(urlS);
    print(respuestaS.body);
    setState(() {
      respuestaSinParametros = (respuestaS.body).toString();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('GET',
            style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          SizedBox(height: 10),
          new RaisedButton(
            color: Color(0xff00BADF),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
            child: Text('Obtener datos',
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                  color: Colors.white
              ),
            ),
            onPressed: (){obtenerDatosGet();},
          ),
          SizedBox(height: 10),
          respuestaGet  == null ? new Text('Datos desde GET') : new Text(
            'Get: $respuestaGet',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30),
          Text('POST',
            style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          SizedBox(height: 10),
          new RaisedButton(
            color: Color(0xff00BADF),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
            child: Text('Obtener datos',
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                  color: Colors.white
              ),
            ),
            onPressed: (){obtenerDatosPost();},
          ),
          SizedBox(height: 10),
          respuestaSring  == null ? new Text('Datos desde POST') : new Text(
            'Post: $respuestaSring',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30),
          Text('Sin Parametros',
            style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          SizedBox(height: 10),
          new RaisedButton(
            color: Color(0xff00BADF),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
            child: Text('Obtener datos',
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                  color: Colors.white
              ),
            ),
            onPressed: (){obtenerDatosSinParametros();},
          ),
          SizedBox(height: 10),
          respuestaSinParametros  == null ? new Text('Datos sin parametros') : new Text(
            'sin parametros: $respuestaSinParametros',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],),
    );
  }
}