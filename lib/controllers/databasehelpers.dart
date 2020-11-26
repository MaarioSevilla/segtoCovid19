import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:segtocovid19/providers/globals.dart' as globals;

class DataBaseHelper {

  String serverUrl = globals.urlServer;
  String serverUrlproducts = "http://192.168.43.131:8000/api/products";
  
  var status ;
  var token ;

  //create function for login
  loginData(String matricula , String password) async{

  String myUrl = "$serverUrl/api/login";
  final response = await  http.post(myUrl,
        headers: {
          'Accept':'application/json'
        },
        body: {
          "matricula": "$matricula",
          "password" : "$password"
        }) ;
    status = response.body.contains('error');

    var data = json.decode(response.body);

    if(status){
      print('data : ${data["error"]}');
    }else{
      print('data : ${data["token"]}');
      _save(data["token"]);
    }
  }

  //create function for register Users
  registerUserData(String matricula, String email, String password, String nombre, String apellido, String apellidoII, String tipoUsuario) async{

    String myUrl = "$serverUrl/api/register";
    final response = await  http.post(myUrl,
        headers: {
          'Accept':'application/json'
        },
        body: {
          "matricula":      "$matricula",
          "email":     "$email",
          "password": "$password",
          "nombre":      "$nombre",
          "apellido":      "$apellido",
          "apellidoII":      "$apellidoII",
          "tipoUsuario":      "$tipoUsuario"
        } ) ;
    status = response.body.contains('error');

    var data = json.decode(response.body);

    if(status){
      print('data : ${data["error"]}');
    }else{
      print('data : ${data["token"]}');
      _save(data["token"]);
    }

    String myUrlRCovid = "$serverUrl/api/resultcovide";
    final responseC = await  http.post(myUrlRCovid,
        headers: {
          'Accept':'application/json'
        },
        body: {
          "matriculai":      "$matricula",
          "resultadoCovid":     "0",
          "fechaPositivoCE": "",
          "fechaNegativoCE":      ""
        } ) ;
    var statusC = responseC.body.contains('error');
    var dataC = json.decode(responseC.body);
    if(statusC){
      print('data : ${dataC["error"]}');
    }else{
      print('data : ${dataC["token"]}');
      _save(dataC["token"]);
      print('se registro');
    }

  }

//function for register products
void addDataProducto(String _nameController , String _priceController, String _stockController) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;

   // String myUrl = "$serverUrl/api";
   String myUrl = "http://192.168.43.131:8000/api/products";
   final response = await  http.post(myUrl,
        headers: {
          'Accept':'application/json'
        },
        body: {
          "name":        "$_nameController",
          "price":        "$_priceController",          
          "stock":      "$_stockController"
        } ) ;
    status = response.body.contains('error');

    var data = json.decode(response.body);

    if(status){
      print('data : ${data["error"]}');
    }else{
      print('data : ${data["token"]}');
      _save(data["token"]);
    }

  }

  //function for update or put
  void editarData(String id, String name , String price, String stock) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;

    String myUrl = "http://192.168.43.131:8000/api/products/$id";
    http.put(myUrl,
        headers: {
          'Accept':'application/json',
          'Authorization' : 'Bearer $value'
        },
        body: {
         "name":       "$name",
         "price":      "$price",
         "stock" :     "$stock"
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

    String myUrl = "http://192.168.43.131:8000/api/products/$id";
    http.delete(myUrl,
        headers: {
          'Accept':'application/json',
          'Authorization' : 'Bearer $value'
    } ).then((response){
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }

  //funciton getData
  Future<List> getData() async{

    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;

    String myUrl = "$serverUrlproducts";
    http.Response response = await http.get(myUrl,
        headers: {
          'Accept':'application/json',
          'Authorization' : 'Bearer $value'
    });
    return json.decode(response.body);
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