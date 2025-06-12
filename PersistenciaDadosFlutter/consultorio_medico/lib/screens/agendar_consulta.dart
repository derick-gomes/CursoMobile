import 'package:flutter/material.dart';
import '../models/consulta.dart';
import '../database/db_helper.dart';

class AgendarConsultaScreen extends StatefulWidget {
  final int pacienteId;
  const AgendarConsultaScreen({super.key, required this.pacienteId});

  @override
  State<AgendarConsultaScreen> createState() => _AgendarConsultaScreenState();
}

class _AgendarConsultaScreenState extends State<AgendarConsultaScreen> {
  final _formKey = GlobalKey<FormState>();
  final dataController = TextEditingController();
  final horaController = TextEditingController();
  final especialidadeController = TextEditingController();
  final observacoesController = TextEditingController();

  void salvarConsulta() async {
    if (_formKey.currentState!.validate()) {
      final novaConsulta = Consulta(
        pacienteId: widget.pacienteId,
        data: dataController.text,
        hora: horaController.text,
        especialidade: especialidadeController.text,
        observacoes: observacoesController.text,
      );
      await DBHelper().insertConsulta(novaConsulta);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Agendar Consulta")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: dataController,
                decoration: const InputDecoration(labelText: "Data (DD/MM/AAAA)"),
                validator: (value) => value!.isEmpty ? "Obrigatório" : null,
              ),
              TextFormField(
                controller: horaController,
                decoration: const InputDecoration(labelText: "Hora (HH:MM)"),
                validator: (value) => value!.isEmpty ? "Obrigatório" : null,
              ),
              TextFormField(
                controller: especialidadeController,
                decoration: const InputDecoration(labelText: "Especialidade / Tipo"),
                validator: (value) => value!.isEmpty ? "Obrigatório" : null,
              ),
              TextFormField(
                controller: observacoesController,
                decoration: const InputDecoration(labelText: "Observações"),
                maxLines: 2,
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: salvarConsulta, child: const Text("Salvar"))
            ],
          ),
        ),
      ),
    );
  }
}
