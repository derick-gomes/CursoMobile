import 'package:flutter/material.dart';

void main() {
  runApp( MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(título: text("Exemplo Colunas(Column)linhas (row)"))
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center, //vertical
          crossAxisAlignment: ,
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
