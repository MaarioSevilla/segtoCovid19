import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:retry/retry.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:segtocovid19/Others/toast_msg.dart';
import 'package:segtocovid19/providers/status_provider.dart';
import 'package:segtocovid19/providers/globals.dart' as globals;
import 'package:segtocovid19/clases/circle_class.dart';

class DataBaseHelperCircle {

  static const serverUrl = globals.urlServer;
  var status ;
  var token ;
  ToasMSG _toast = new ToasMSG();
  String serverUrltemperatura = "$serverUrl/api/temperatura";
  StatusProvider _statusProvider = new StatusProvider();

  //function for register temperature

  addData(String idGrupo) async{
    String _matricula = await _statusProvider.checkLoginStatus();
    print('prueba resultado $_matricula');
    var data;
    try {
      final r = RetryOptions(maxAttempts: 8);
      String myUrl =  "$serverUrl/api/circulo";
      final response = await await r.retry(
            () => http.post(myUrl,
            headers: {
              'Accept': 'application/json'
            },
            body: {
              "idGrupo":       "$idGrupo",
              "matriculaID":      "$_matricula"
            }).timeout(Duration(seconds: 15)),
        // Retry on SocketException or TimeoutException
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );
      status = response.body.contains('error');
      data = json.decode(response.body);
      if(status){
        print('data : ${data["error"]}');
        _toast.toastmsg("Algo salio mal");
      }else{
        print('data : ${data["token"]}');
        _save(data["token"]);
        _toast.toastmsg("Se ha registrado con exito");
      }
    }on SocketException {
      print('No se pudo establecer conexion con el servidor 😑 Registrar temperatura');
      _toast.toastmsg("No se pudo establecer conexion con el servidor");
    } on HttpException {
      print("Couldn't find the post 😱  Registrar temperatura");
    } on FormatException {
      print("Bad response format 👎  Registrar temperatura");
    }
  }

  //function for update or put
  void editarData(String id, String idGrupo , String matriculaID) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    String myUrl = "$serverUrl/api/circulo/$id";
    http.put(myUrl,
        headers: {
          'Accept':'application/json',
          'Authorization' : 'Bearer $value'
        },
        body: {
          "idGrupo":       "$idGrupo",
          "matriculaID":      "$matriculaID"
        }).then((response){
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }

  //function for delete
  void removeRegister(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;

    String myUrl = "$serverUrl/api/circulo/$id";
    http.delete(myUrl,
        headers: {
          'Accept':'application/json',
          'Authorization' : 'Bearer $value'
        } ).then((response){
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
      if (response.statusCode == 200) {
        _toast.toastmsg("Se ha eliminado con exito");
      }
    });
  }

  Future<List<Circle>> getCircle() async {
    StatusProvider _statusProvider = new StatusProvider();
    String _matricula = _statusProvider.checkLoginStatus();
    print('prueba resultado $_matricula');
    String myUrl;

    myUrl = "$serverUrl/api/circulo/cebyid/$_matricula";

    try {
      final response = await http.get(myUrl);
      print('getEmployees Response: ${response.body}');
      if (200 == response.statusCode) {
        var parsed = json.decode(response.body);
        List jsonResponse = parsed["data"] as List;
        return jsonResponse.map((job) => new Circle.fromJson(job)).toList();
      } else {
        return List<Circle>();
      }
    } catch (e) {
      return List<Circle>(); // return an empty list on exception/error
    }
  }

  getAllData() async {
    String _matricula = await _statusProvider.checkLoginStatus();
    print('prueba resultado $_matricula');
    String myUrl;
    myUrl = "$serverUrl/api/circulo/cebyid/$_matricula";
    try{
      final r = RetryOptions(maxAttempts: 4);
      final response = await r.retry(
        // Make a GET request
            () => http.get(myUrl).timeout(Duration(seconds: 15)),
        // Retry on SocketException or TimeoutException
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );
      //guardado y actualizacion de mapas
      return json.decode(response.body);
    }on SocketException {
      print('No se pudo establecer conexion con el servidor 😑');
      _toast.toastmsg("No se pudo establecer conexión con el servidor");
      return '{ok: true, data: []}';
    } on HttpException {
      print("Couldn't find the post 😱");
      return '{ok: true, data: []}';
    } on FormatException {
      print("Bad response format 👎");
      return '{ok: true, data: []}';
    }
  }

  //function save
  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }

  //function read
  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;
    print('read : $value');
  }
}