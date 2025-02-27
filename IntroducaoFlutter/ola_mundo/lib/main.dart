// flutter crate --plaforms-android --empty
// ola_mundo_dependecias

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("ola mundo")),
        body: Center(
          child: ElevatedButton(
           	d: () {
              Fluttertoast.showToast(
                msg: "Olá, Mundo!",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
              );
            },
            onPressed: () {  },
            child: Text("Mostrar Mensagem"),
          ),
        ),
      ),
    );
  }
}

