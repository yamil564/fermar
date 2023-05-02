import "package:flutter/material.dart";

class Usuarios extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Usuarios'),
      ),
      body: new Column(
        children: <Widget>[new Text('Estamos en usuarios')],
      ),
    );
  }
}
