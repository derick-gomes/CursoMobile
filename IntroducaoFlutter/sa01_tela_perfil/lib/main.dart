import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ProfilePage());
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Perfil de Usuário')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Foto de perfil
            CircleAvatar(radius: 50, backgroundImage: AssetImage('assets/profile.jpg')),
            SizedBox(height: 20),
            
            // Nome e descrição
            Text('João da Silva', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text('Desenvolvedor Flutter', style: TextStyle(fontSize: 16, color: Colors.grey)),
            SizedBox(height: 20),
            
            // Informações
            ..._infoRow('Idade', '30 anos'),
            ..._infoRow('Cidade', 'São Paulo'),
            ..._infoRow('Profissão', 'Desenvolvedor'),
            ..._infoRow('Email', 'joao.silva@email.com'),
            SizedBox(height: 20),
            
            // Texto sobreposto com estrelas
            Stack(
              alignment: Alignment.center,
              children: [
                Container(height: 160, width: 160, color: Colors.orange),
                Container(height: 130, width: 130, color: Colors.white),
                Positioned(
                  top: 20,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text( textAlign: TextAlign.center, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                      Row(mainAxisSize: MainAxisSize.min, children: List.generate(5, (index) => Icon(Icons.star, color: Colors.yellow, size: 30))),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            
            // Redes sociais
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _socialIcon(Icons.facebook, Colors.blue),
                _socialIcon(Icons.camera_alt, Colors.pink),
                _socialIcon(Icons.email, Colors.blueAccent),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Função para criar linha de informações
  List<Widget> _infoRow(String title, String value) {
    return [
      Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(color: Colors.blue[50], borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('$title:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text(value, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    ];
  }

  // Função para criar ícones de redes sociais
  Widget _socialIcon(IconData icon, Color color) {
    return IconButton(
      icon: Icon(icon, color: color, size: 30),
      onPressed: () => print('$icon Pressionado'),
    );
  }
}
