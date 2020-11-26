import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToasMSG {

  void toastmsg(String _msg){
    Fluttertoast.showToast(
        msg: "$_msg",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 2,
        backgroundColor: Color(0xffE2DDEA),
        textColor: Colors.black,
        fontSize: 16.0
    );
  }

}