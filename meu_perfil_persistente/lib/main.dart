import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MeuPerfilPersistenteApp());
}

void runApp(MeuPerfilPersistenteApp meuPerfilPersistenteApp) {
}

class MeuPerfilPersistenteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu Perfil Persistente',
      home: PerfilPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class StatelessWidget {
}

class PerfilPage extends StatefulWidget {
  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _idadeController = TextEditingController();
  String _corFavorita = 'Azul';

  String _nomeSalvo = '';
  String _idadeSalva = '';
  String _corSalva = 'Azul';

  final List<String> _cores = ['Azul', 'Verde', 'Vermelho', 'Amarelo', 'Roxo'];

  Color _getColor(String cor) {
    switch (cor) {
      case 'Verde':
        return Colors.green;
      case 'Vermelho':
        return Colors.red;
      case 'Amarelo':
        return Colors.yellow;
      case 'Roxo':
        return Colors.purple;
      case 'Azul':
      default:
        return Colors.blue;
    }
  }

  @override
  void initState() {
    super.initState();
    _carregarDados();
  }

  Future<void> _carregarDados() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _nomeSalvo = prefs.getString('nome') ?? '';
      _idadeSalva = prefs.getString('idade') ?? '';
      _corSalva = prefs.getString('cor') ?? 'Azul';

      _nomeController.text = _nomeSalvo;
      _idadeController.text = _idadeSalva;
      _corFavorita = _corSalva;
    });
  }

  Future<void> _salvarDados() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('nome', _nomeController.text);
    await prefs.setString('idade', _idadeController.text);
    await prefs.setString('cor', _corFavorita);

    setState(() {
      _nomeSalvo = _nomeController.text;
      _idadeSalva = _idadeController.text;
      _corSalva = _corFavorita;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _getColor(_corSalva).withOpacity(0.2),
      appBar: AppBar(
        title: Text('Meu Perfil Persistente'),
        backgroundColor: _getColor(_corSalva),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _idadeController,
              decoration: InputDecoration(labelText: 'Idade'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _corFavorita,
              decoration: InputDecoration(labelText: 'Cor favorita'),
              items: _cores
                  .map((cor) => DropdownMenuItem(
                        value: cor,
                        child: Text(cor),
                      ))
                  .toList(),
              onChanged: (novaCor) {
                setState(() {
                  _corFavorita = novaCor!;
                });
              },
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _salvarDados,
              child: Text('Salvar Dados'),
              style: ElevatedButton.styleFrom(
                backgroundColor: _getColor(_corFavorita),
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Dados salvos:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Nome: $_nomeSalvo'),
            Text('Idade: $_idadeSalva'),
            Text('Cor favorita: $_corSalva'),
          ],
        ),
      ),
    );
  }
}
