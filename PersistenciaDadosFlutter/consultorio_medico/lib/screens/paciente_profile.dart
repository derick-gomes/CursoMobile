import 'package:flutter/material.dart';
import '../models/paciente.dart';
import '../models/consulta.dart';
import '../database/db_helper.dart';
import 'agendar_consulta.dart';

class PacienteProfileScreen extends StatefulWidget {
  final Paciente paciente;
  const PacienteProfileScreen({super.key, required this.paciente});

  @override
  State<PacienteProfileScreen> createState() => _PacienteProfileScreenState();
}

class _PacienteProfileScreenState extends State<PacienteProfileScreen> {
  List<Consulta> consultas = [];

  void carregarConsultas() async {
    final lista = await DBHelper().getConsultasPorPaciente(widget.paciente.id!);
    setState(() {
      consultas = lista;
    });
  }

  @override
  void initState() {
    super.initState();
    carregarConsultas();
  }

  @override
  Widget build(BuildContext context) {
    final p = widget.paciente;

    return Scaffold(
      appBar: AppBar(title: Text('Perfil: ${p.nome}')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("CPF: ${p.cpf}"),
            Text("Nascimento: ${p.dataNascimento}"),
            Text("Telefone: ${p.telefone}"),
            Text("Email: ${p.email}"),
            const SizedBox(height: 20),
            const Text("Histórico de Consultas:", style: TextStyle(fontWeight: FontWeight.bold)),
            Expanded(
              child: consultas.isEmpty
                  ? const Text("Nenhuma consulta agendada.")
                  : ListView.builder(
                      itemCount: consultas.length,
                      itemBuilder: (context, index) {
                        final c = consultas[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          child: ListTile(
                            title: Text("${c.data} às ${c.hora}"),
                            subtitle: Text("Especialidade: ${c.especialidade}\nObs: ${c.observacoes}"),
                            trailing: Text(c.status),
                          ),
                        );
                      },
                    ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AgendarConsultaScreen(pacienteId: p.id!),
            ),
          );
          carregarConsultas();
        },
      ),
    );
  }
}
