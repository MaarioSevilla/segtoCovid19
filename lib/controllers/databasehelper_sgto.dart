import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:retry/retry.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:segtocovid19/Others/toast_msg.dart';
import 'package:segtocovid19/providers/status_provider.dart';
import 'package:segtocovid19/providers/globals.dart' as globals;

class DataBaseHelperSgto {
  var status ;
  var token ;
  static const serverUrl = globals.urlServer;
  ToasMSG _toast = new ToasMSG();
  StatusProvider _statusProvider = new StatusProvider();

  //function for register Sintoma
  void addDataSymptom(String _sintoma, String _gravedad, String _fechaHora) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;
    String _matricula = await _statusProvider.checkLoginStatus();
    print('prueba resultado $_matricula');
    if(_matricula!=null){
      try{
        String myUrl = "$serverUrl/api/sgtosymptoms";
        final response = await  http.post(myUrl,
            headers: {
              'Accept':'application/json'
            },
            body: {
              "iMatricula":        "$_matricula",
              "sintoma":        "$_sintoma",
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

  void editarData(String _idSgtoSintomas,String _iMatricula, String _sintoma, String _gravedad, String _fechaHora) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;

    String myUrl = "$serverUrl/api/sgtosymptoms/$_idSgtoSintomas";
    http.put(myUrl,
        headers: {
          'Accept':'application/json',
          'Authorization' : 'Bearer $value'
        },
        body: {
          "iMatricula":        "$_iMatricula",
          "sintoma":      "$_sintoma",
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

  void removeRegister(String idSgtoSintomas) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;

    String myUrl = "$serverUrl/api/sgtosymptoms/$idSgtoSintomas";
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
      String myUrl = "$serverUrl/api/sgtosymptoms/onelastreg/$_matricula";
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

  getAllData(String _sintoma) async {
    String _matricula = await _statusProvider.checkLoginStatus();
    print('prueba resultado $_matricula');
    String myUrl;
    if(_sintoma=="fiebre"){
      myUrl = "$serverUrl/api/temperatura/showallbymat/$_matricula";
    }else if(_sintoma=="Tos seca"){
      myUrl = "$serverUrl/api/sgtotos/showallbymat/$_matricula";
    }else if(_sintoma=="Cansancio"){
      myUrl = "$serverUrl/api/sgtosymptoms/showallbymat/$_matricula/1";
    }else if(_sintoma=="Molestias y dolores"){
      myUrl = "$serverUrl/api/sgtosymptoms/showallbymat/$_matricula/2";
    }else if(_sintoma=="Dolor de garganta"){
      myUrl = "$serverUrl/api/sgtosymptoms/showallbymat/$_matricula/3";
    }else if(_sintoma=="Diarrea"){
      myUrl = "$serverUrl/api/sgtosymptoms/showallbymat/$_matricula/4";
    }else if(_sintoma=="Conjuntivitis"){
      myUrl = "$serverUrl/api/sgtosymptoms/showallbymat/$_matricula/5";
    }else if(_sintoma=="Dolor de cabeza"){
      myUrl = "$serverUrl/api/sgtosymptoms/showallbymat/$_matricula/6";
    }else if(_sintoma=="Pérdida del sentido del olfato"){
      myUrl = "$serverUrl/api/sgtosymptoms/showallbymat/$_matricula/7";
    }else if(_sintoma=="Erupciones cutáneas"){
      myUrl = "$serverUrl/api/sgtosymptoms/showallbymat/$_matricula/8";
    }else if(_sintoma=="Dificultad para respirar"){
      myUrl = "$serverUrl/api/sgtoaire/showallbymat/$_matricula";
    }else if(_sintoma=="Dolor o presión en el pecho"){
      myUrl = "$serverUrl/api/sgtosymptoms/showallbymat/$_matricula/9";
    }else if(_sintoma=="Incapacidad para hablar o moverse"){
      myUrl = "$serverUrl/api/sgtosymptoms/showallbymat/$_matricula/10";
    }
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

  getThreeData(String _sintoma) async {
    String _matricula = await _statusProvider.checkLoginStatus();
    print('prueba resultado $_matricula');
    String myUrl;
    if(_sintoma=="Cansancio"){
      myUrl = "$serverUrl/api/sgtosymptoms/showthreebymat/$_matricula/1";
    }else if(_sintoma=="Molestias y dolores"){
      myUrl = "$serverUrl/api/sgtosymptoms/showthreebymat/$_matricula/2";
    }else if(_sintoma=="Dolor de garganta"){
      myUrl = "$serverUrl/api/sgtosymptoms/showthreebymat/$_matricula/3";
    }else if(_sintoma=="Diarrea"){
      myUrl = "$serverUrl/api/sgtosymptoms/showthreebymat/$_matricula/4";
    }else if(_sintoma=="Conjuntivitis"){
      myUrl = "$serverUrl/api/sgtosymptoms/showthreebymat/$_matricula/5";
    }else if(_sintoma=="Dolor de cabeza"){
      myUrl = "$serverUrl/api/sgtosymptoms/showthreebymat/$_matricula/6";
    }else if(_sintoma=="Pérdida del sentido del olfato"){
      myUrl = "$serverUrl/api/sgtosymptoms/showthreebymat/$_matricula/7";
    }else if(_sintoma=="Erupciones cutáneas"){
      myUrl = "$serverUrl/api/sgtosymptoms/showthreebymat/$_matricula/8";
    }else if(_sintoma=="Dolor o presión en el pecho"){
      myUrl = "$serverUrl/api/sgtosymptoms/showthreebymat/$_matricula/9";
    }else if(_sintoma=="Incapacidad para hablar o moverse"){
      myUrl = "$serverUrl/api/sgtosymptoms/showthreebymat/$_matricula/10";
    }
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
}