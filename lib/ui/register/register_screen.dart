import 'package:flutter/material.dart';
import 'package:segtocovid19/ui/register/register_form.dart';

class RegisterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registrarse'),backgroundColor: Color(0xffFB243A),),
      body: Center(
          child: RegisterForm(),
        ),
    );
  }
}