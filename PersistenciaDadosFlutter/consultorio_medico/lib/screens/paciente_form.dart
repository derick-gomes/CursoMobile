import 'package:flutter/material.dart';
import '../models/paciente.dart';
import '../database/db_helper.dart';

class PacienteFormScreen extends StatefulWidget {
  const PacienteFormScreen({super.key});

  @override
  State<PacienteFormScreen> createState() => _PacienteFormScreenState();
}

class _PacienteFormScreenState extends State<PacienteFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final nomeController = TextEditingController();
  final cpfController = TextEditingController();
  final dataController = TextEditingController();
  final telefoneController = TextEditingController();
  final emailController = TextEditingController();

  void salvar() async {
    if (_formKey.currentState!.validate()) {
      final paciente = Paciente(
        nome: nomeController.text,
        cpf: cpfController.text,
        dataNascimento: dataController.text,
        telefone: telefoneController.text,
        email: emailController.text,
      );
      await DBHelper().insertPaciente(paciente);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Novo Paciente")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: nomeController,
                decoration: const InputDecoration(labelText: "Nome completo"),
                validator: (value) => value!.isEmpty ? "Obrigatório" : null,
              ),
              TextFormField(
                controller: cpfController,
                decoration: const InputDecoration(labelText: "CPF"),
                validator: (value) => value!.isEmpty ? "Obrigatório" : null,
              ),
              TextFormField(
                controller: dataController,
                decoration: const InputDecoration(labelText: "Data de Nascimento"),
              ),
              TextFormField(
                controller: telefoneController,
                decoration: const InputDecoration(labelText: "Telefone"),
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: "E-mail"),
                validator: (value) => value!.contains("@") ? null : "E-mail inválido",
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: salvar, child: const Text("Salvar")),
            ],
          ),
        ),
      ),
    );
  }
}
