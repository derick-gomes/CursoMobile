import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home:Myapp()));
}

class Myapp extends StatelessWidget {
  final List<String> imagens = [
    'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0',
        'https://images.unsplash.com/photo-1521747116042-5a810fda9664',
        'https://images.unsplash.com/photo-1504384308090-c894fdcc538d',
        'https://images.unsplash.com/photo-1518837695005-2083093ee35b',
        'https://images.unsplash.com/photo-1506619216599-9d16d0903dfd',
        'https://images.unsplash.com/photo-1494172961521-33799ddd43a5',
        'https://images.unsplash.com/photo-1517245386807-bb43f82c33c4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Galeria de Imagens')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Define 3 imagens por linha
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: imagens.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => _mostrarImagem(context, imagens[index]),
              child: Image.network(imagens[index], fit: BoxFit.cover),
            );
          },
        ),
      ),
    );
  } // fim widget Build

  //metodos_mostrar imagem
  void _mostrarImagem(BuildContext context, String url) {
    showDialog(
      context: context,
      builder: (context) => Dialog(child: Image.network(url)),
    );
  }
}
