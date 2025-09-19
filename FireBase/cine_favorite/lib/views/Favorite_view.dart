import 'package:flutter/material.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
      ),
      body: Center(
        child: const Text(
          'Nenhum favorito adicionado ainda.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}