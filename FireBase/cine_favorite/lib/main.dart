import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  //garante o carregamento 
  WidgetsFlutterBinding.ensureInitialized();

  //conectar com o FireBase
  await Firebase.initializeApp();
  
  runApp(MaterialApp(
    title: "Cine Favorite",
    theme: ThemeData(
      primarySwatch: Colors.orange,
      brightness: Brightness.dark
    ),
    home: AuthStream(),
  ));

}

class AuthStream extends StatelessWidget {
  const AuthStream({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>( //permite usuário null
      stream: FirebaseAuth.instance.authStateChanges(), //identifica a mudança de status da auth 
      builder: (context, snapshot){
        //se tiver logado , vai para a tela de Favoritos
        if(snapshot.hasData){ //verifica se o snapshot tem algum dado
          return Favorite_View();
        } //caso não estiver logado
        return Login_View();
      });
  }

  Widget Favorite_View() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
      ),
      body: Center(
        child: const Text('Tela de Favoritos'),
      ),
    );
  }
}

class   Login_View extends StatelessWidget {
  const Login_View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: const Text('Tela de Login'),
      ),
    );
  }
}