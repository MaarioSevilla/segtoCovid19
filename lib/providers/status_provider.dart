import 'package:shared_preferences/shared_preferences.dart';

class StatusProvider{

  SharedPreferences sharedPreferences;

  checkLoginStatus()  async {
    String _matricula;
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("matricula") == null) {
      print('no lo guardo');
      return null;
    }else{
      print('si lo guarde');
      _matricula=sharedPreferences.getString("matricula");
      return _matricula;
    }
  }
}