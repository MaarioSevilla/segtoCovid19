import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:retry/retry.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:segtocovid19/Others/toast_msg.dart';
import 'package:segtocovid19/providers/status_provider.dart';
import 'package:segtocovid19/providers/globals.dart' as globals;

class DataBaseHelperCircle {

  static const serverUrl = globals.urlServer;
  var status ;
  var token ;
  ToasMSG _toast = new ToasMSG();
  StatusProvider _statusProvider = new StatusProvider();

  //function for register circulo

}