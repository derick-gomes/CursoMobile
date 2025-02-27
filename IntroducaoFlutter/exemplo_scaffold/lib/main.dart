import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Exemplo de Scaffold'),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Text('Conteúdo da tela', style: TextStyle(fontSize: 20)),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('Botão pressionado!');
          },
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
          ],
        ),
      ),
    );
  }
}
AppBar(
  title: Text('Minha Aplicação'),
  backgroundColor: Colors.deepPurple,
  actions: [
    IconButton(
      icon: Icon(Icons.search),
      onPressed: () {
        print('Clicou na lupa');
      },
    ),
    IconButton(
      icon: Icon(Icons.notifications),
      onPressed: () {
        print('Clicou no sino');
      },
    ),
  ],
)
Scaffold(
  appBar: AppBar(title: Text('Exemplo de Drawer')),
  drawer: Drawer(
    child: ListView(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(color: Colors.blue),
          child: Text('Menu', 
style: TextStyle(
color: Colors.white, 
fontSize: 24)),
        			),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Início'),
          onTap: () {
            print('Início pressionado');
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Configurações'),
          onTap: () {
            print('Configurações pressionado');
          },
        ),
      ],
    ),
  ),
)
Scaffold(
  bottomNavigationBar: BottomNavigationBar(
    items: [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
    ],
  ),
)


