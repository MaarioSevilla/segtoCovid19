import 'package:shared_preferences/shared_preferences.dart';

class Utilities{

  SharedPreferences sharedPreferences;

  Future<void> GetMatricula() async {
    String _matricula;
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("matricula") == null) {
      print('no lo guardo');
      return null;
    }else{
      _matricula=sharedPreferences.getString("matricula");
      print('si lo guarde');
      print(_matricula);
      return _matricula;
    }
  }

}