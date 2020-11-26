import 'dart:async';
import 'dart:io';
import 'package:segtocovid19/Others/toast_msg.dart';
import 'package:http/http.dart' as http;
import 'package:retry/retry.dart';
import 'package:segtocovid19/providers/status_provider.dart';
import 'dart:convert';
import 'package:segtocovid19/providers/globals.dart' as globals;

class DataBaseHelperUser {

  ToasMSG _toast = new ToasMSG();
  StatusProvider _statusProvider = new StatusProvider();
  String serverUrl = globals.urlServer;

  getDataUser() async {
    String _matricula = await _statusProvider.checkLoginStatus();
    print('prueba resultado $_matricula');
    String myUrl= "$serverUrl/api/myuser/$_matricula";
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

  getResulCovid() async {
    String _matricula = await _statusProvider.checkLoginStatus();
    print('prueba resultado $_matricula');
    String myUrl= "$serverUrl/api/resultcovide/showme/$_matricula";
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

}