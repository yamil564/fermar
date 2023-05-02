import 'dart:convert';
import 'dart:html';

import 'package:fermar/pages/powerPage.dart';
import 'package:fermar/pages/usuariosPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(LoginApp());

String username;

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fermar',
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        '/powerPage': (BuildContext context) => new Power(),
        '/usuariosPage': (BuildContext context) => new Usuarios(),
        '/LoginPage': (BuildContext context) => LoginPage(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController controllerUser = new TextEditingController();
  TextEditingController controllerPass = new TextEditingController();

  String mensaje = '';

  Future<List> login() async {
    final response = await http.post("http://192.168.0.17/fermar/login.php",
    body: {
      "username": controllerUser.text, 
      "password": controllerPass.text,
    });
  
  var datauser = json.decode(response.body);

  if (datauser.length == 0) {
    setState(() {
      mensaje = "usuario o contraseña incorrecto";
    });
  } else {
      if (datauser[0]['nivel']=='2'){
        Navigator.pushReplacementNamed(context, '/powerPage');
      } else if (datauser[0]['nivel']=='1'{
        Navigator.pushReplacementNamed(context, '/usuariosPage');
      }
      setState((){
        username= username[0]['username'];
      });
    }
    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    )
  }
}