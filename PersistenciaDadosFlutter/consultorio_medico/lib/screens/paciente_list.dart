import 'package:flutter/material.dart';
import '../database/db_helper.dart';
import '../models/paciente.dart';
import 'paciente_form.dart';
import 'paciente_profile.dart';

class PacienteListScreen extends StatefulWidget {
  const PacienteListScreen({super.key});

  @override
  State<PacienteListScreen> createState() => _PacienteListScreenState();
}

class _PacienteListScreenState extends State<PacienteListScreen> {
  List<Paciente> pacientes = [];

  void carregarPacientes() async {
    final lista = await DBHelper().getPacientes();
    setState(() {
      pacientes = lista;
    });
  }

  @override
  void initState() {
    super.initState();
    carregarPacientes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pacientes")),
      body: ListView.builder(
        itemCount: pacientes.length,
        itemBuilder: (context, index) {
          final p = pacientes[index];
          return ListTile(
            title: Text(p.nome),
            subtitle: Text(p.email),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PacienteProfileScreen(paciente: p),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const PacienteFormScreen()),
          );
          carregarPacientes();
        },
      ),
    );
  }
}
