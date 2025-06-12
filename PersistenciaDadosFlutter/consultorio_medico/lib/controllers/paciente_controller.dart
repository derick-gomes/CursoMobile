import 'package:flutter/material.dart';
import '../models/paciente.dart';
import '../database/database_helper.dart';

class PacienteController extends ChangeNotifier {
  final List<Paciente> _pacientes = [];

  List<Paciente> get pacientes => _pacientes;

  Future<void> carregarPacientes() async {
    final dados = await DatabaseHelper.instance.getPacientes();
    _pacientes.clear();
    _pacientes.addAll(dados);
    notifyListeners();
  }

  Future<void> adicionarPaciente(Paciente paciente) async {
    await DatabaseHelper.instance.insertPaciente(paciente);
    await carregarPacientes();
  }

  Future<void> atualizarPaciente(Paciente paciente) async {
    await DatabaseHelper.instance.updatePaciente(paciente);
    await carregarPacientes();
  }

  Future<void> removerPaciente(int id) async {
    await DatabaseHelper.instance.deletePaciente(id);
    await carregarPacientes();
  }

  Paciente? buscarPacientePorId(int id) {
    return _pacientes.firstWhere((p) => p.id == id, orElse: () => null);
  }
}
