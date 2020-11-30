import 'dart:async';
import 'dart:io';
import 'package:segtocovid19/Others/toast_msg.dart';
import 'package:http/http.dart' as http;
import 'package:retry/retry.dart';
import 'package:segtocovid19/providers/status_provider.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:segtocovid19/providers/globals.dart' as globals;

class DataBaseHelperTemperature {

  ToasMSG _toast = new ToasMSG();
  StatusProvider _statusProvider = new StatusProvider();
  static const serverUrl = globals.urlServer;
  String serverUrltemperatura = "$serverUrl/api/temperatura";
  var status ;
  var token ;

  //function for register temperature

  Future<bool> addDataTemperatura(String _idMatricula , String _fecha, String _temperaturaController) async{
    var data;
    try {
      final r = RetryOptions(maxAttempts: 8);
      String myUrl =  "$serverUrl/api/temperatura";
      final response = await await r.retry(
            () => http.post(myUrl,
                headers: {
                  'Accept': 'application/json'
                },
                body: {
                  "idMatricula": "$_idMatricula",
                  "fecha": "$_fecha",
                  "temperatura": "$_temperaturaController"
                }).timeout(Duration(seconds: 15)),
        // Retry on SocketException or TimeoutException
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );
      status = response.body.contains('error');
      data = json.decode(response.body);
    }on SocketException {
      print('No se pudo establecer conexion con el servidor 😑 Registrar temperatura');
      _toast.toastmsg("No se pudo establecer conexion con el servidor");
      return false;
    } on HttpException {
      print("Couldn't find the post 😱  Registrar temperatura");
      return false;
    } on FormatException {
      print("Bad response format 👎  Registrar temperatura");
      return false;
    }
    if(status){
      print('error data : ${data["error"]}');
      _toast.toastmsg("Algo salio mal");
      return false;
    }else{
      print('data : ${data["token"]}');
      _save(data["token"]);
      print('lo guarde');
      return true;
    }
  }

  //function for update or put
  void editarData(String idSgtoTemp, String _idMatricula , String _fecha, String _temperaturaController) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    String myUrl = "$serverUrl/api/temperatura/$idSgtoTemp";
    http.put(myUrl,
        headers: {
          'Accept':'application/json',
          'Authorization' : 'Bearer $value'
        },
        body: {
          "idMatricula": "$_idMatricula",
          "fecha": "$_fecha",
          "temperatura": "$_temperaturaController"
        }).then((response){
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
      if (response.statusCode == 200) {
        _toast.toastmsg("Se ha actualizado con exito");
      }
    });
  }

  //function for delete
  void removeRegister(String idSgtoTemp) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;

    String myUrl = "$serverUrl/api/temperatura/$idSgtoTemp";
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

  //funciton getData
  Future<List> getData() async{

    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;

    String myUrl = "$serverUrltemperatura";
    http.Response response = await http.get(myUrl,
        headers: {
          'Accept':'application/json',
          'Authorization' : 'Bearer $value'
        });
    return json.decode(response.body);
  }

  //funciton getData
  getThreeData() async{
    String _matricula = await _statusProvider.checkLoginStatus();
    print('prueba resultado $_matricula');

    String myUrl = "$serverUrl/api/temperatura/showthreebymat/$_matricula";
    try{

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