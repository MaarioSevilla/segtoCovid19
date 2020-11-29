import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:retry/retry.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:segtocovid19/Others/toast_msg.dart';
import 'package:segtocovid19/providers/status_provider.dart';
import 'package:segtocovid19/providers/globals.dart' as globals;

class DataBaseHelperTos {

  var status ;
  var token ;
  ToasMSG _toast = new ToasMSG();
  StatusProvider _statusProvider = new StatusProvider();
  static const serverUrl = globals.urlServer;

  //function for register Sintoma
  void addDataTos(String _gravedad, String _fechaHora) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;
    String _matricula = await _statusProvider.checkLoginStatus();
    print('prueba resultado $_matricula');
    if(_matricula!=null){
      try{
        String myUrl = "$serverUrl/api/sgtotos";
        final response = await  http.post(myUrl,
            headers: {
              'Accept':'application/json'
            },
            body: {
              "iSTMatricula":        "$_matricula",
              "gravedad":      "$_gravedad",
              "fechaHora":      "$_fechaHora"
            } ) ;
        status = response.body.contains('error');
        var data = json.decode(response.body);
        if(status){
          print('data : ${data["error"]}');
          _toast.toastmsg("Algo salio mal");
        }else{
          print('data : ${data["token"]}');
          _save(data["token"]);
          _toast.toastmsg("Se ha registrado con exito");
        }
      }on SocketException {
        print('No se pudo establecer conexion con el servidor 😑');
        _toast.toastmsg("No se pudo establecer conexión con el servidor");
      } on HttpException {
        print("Couldn't find the post 😱");
      } on FormatException {
        print("Bad response format 👎");
      }
    }
  }

  void editarData(String _idSegtoTos,String _iSTMatricula, String _gravedad, String _fechaHora) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;

    String myUrl = "$serverUrl/api/sgtotos/$_idSegtoTos";
    http.put(myUrl,
        headers: {
          'Accept':'application/json',
          'Authorization' : 'Bearer $value'
        },
        body: {
          "iSTMatricula":        "$_iSTMatricula",
          "gravedad":      "$_gravedad",
          "fechaHora":      "$_fechaHora"
        }).then((response){
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
      if (response.statusCode == 200) {
        _toast.toastmsg("Se ha actualizado con exito");
      }
    });
  }

  ///
  ///function for delete
  ///

  void removeRegister(String idSegtoTos) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;

    String myUrl = "$serverUrl/api/sgtotos/$idSegtoTos";
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
    }
    );
  }


  getDataLast() async {
    String _matricula = await _statusProvider.checkLoginStatus();
    print('prueba resultado $_matricula');
    try{
      String myUrl = "$serverUrl/api/sgtotos/onelastreg/$_matricula";
      final r = RetryOptions(maxAttempts: 3);
      final response = await r.retry(
        // Make a GET request
            () => http.get(myUrl).timeout(Duration(seconds: 20)),
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

  getDataLastThree() async {
    String _matricula = await _statusProvider.checkLoginStatus();
    print('prueba resultado $_matricula');
    try{
      String myUrl = "$serverUrl/api/sgtotos/showthreebymat/$_matricula";
      final r = RetryOptions(maxAttempts: 3);
      final response = await r.retry(
        // Make a GET request
            () => http.get(myUrl).timeout(Duration(seconds: 20)),
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