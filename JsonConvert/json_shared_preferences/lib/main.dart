import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp>{
  bool temaEscuro = false;
  String nomeUsuario = "";

  @override
  void initState() {
    super.initState();
    carregarPreferencias();
  }

  void carregarPreferencias() async{
    //conecta com as shared preferences e busca as informações aramazenadas
    final prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('config');
    if(jsonString != null) {
      Map<String,dynamic> config = json.decode(jsonString);
      setState(() {
        temaEscuro = config['temaEscuro'] ?? false;
        nomeUsuario = config['nome'] ?? "";
      });
    }

  }
}