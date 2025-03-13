import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}
cd
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Exemplo Colunas (Column) e Linhas (Row)")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center, //vertical
          crossAxisAlignment: CrossAxisAlignment.center, //horizontal
          children: [Text('Hello World!')],
        ),
      ),
    );
  }
}
