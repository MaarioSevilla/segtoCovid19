import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:segtocovid19/Others/toast_msg.dart';
import 'package:segtocovid19/providers/globals.dart' as globals;

class DataBaseHelperFamily {

  var status ;
  var token ;
  ToasMSG _toast = new ToasMSG();
  static const serverUrl = globals.urlServer;

  ///
  ///funcion para Crear
  ///

  Future<bool> addFamilyMember(String _parentescoController , String _nombreFController, String _apellidoFController, String _apellidoFIIController, String _idFMatricula ) async{

    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;
    var data;
    // String myUrl = "$serverUrl/api";

    try {
      String myUrl = "$serverUrl/api/family";
      final response = await http.post(myUrl,
          headers: {
            'Accept': 'application/json'
          },
          body: {
            "parentesco": "$_parentescoController",
            "nombreF": "$_nombreFController",
            "apellidoF": "$_apellidoFController",
            "apellidoFII": "$_apellidoFIIController",
            "idFMatricula": "$_idFMatricula"
          });
      status = response.body.contains('error');
      data = json.decode(response.body);
    }on SocketException {
      print('No se pudo establecer conexion con el servidor 😑');
      _toast.toastmsg("No se pudo establecer conexión con el servidor");
      return false;
    } on HttpException {
      print("Couldn't find the post 😱");
      return false;
    } on FormatException {
      print("Bad response format 👎");
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
      _toast.toastmsg("Se ha registrado con exito");
      return true;
    }
  }

  ///
  ///function for update or put
  ///

  void editarData(String idFamiliar, String parentesco , String nombreF, String apellidoF, String apellidoFII, String idFMatricula) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;

    String myUrl = "$serverUrl/api/family/$idFamiliar";
    http.put(myUrl,
        headers: {
          'Accept':'application/json',
          'Authorization' : 'Bearer $value'
        },
        body: {
          "parentesco":       "$parentesco",
          "nombreF":      "$nombreF",
          "apellidoF":       "$apellidoF",
          "apellidoFII":      "$apellidoFII",
          "idFMatricula" :     "$idFMatricula"
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

  void removeRegister(String idFamiliar) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;

    String myUrl = "$serverUrl/api/family/$idFamiliar";
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


  ///
  ///function save
  ///

  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }

  ///
  ///function read
  ///

  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;
    print('read : $value');
  }

}
