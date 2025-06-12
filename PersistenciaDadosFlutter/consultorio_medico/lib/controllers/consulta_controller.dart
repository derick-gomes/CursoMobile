import 'package:flutter/material.dart';
import '../models/consulta.dart';
import '../database/db_helper.dart';

class ConsultaController extends ChangeNotifier {
  final List<Consulta> _consultas = [];

  List<Consulta> get consultas => _consultas;

  Future<void> carregarConsultas(dynamic DatabaseHelper) async {
    final dados = await DatabaseHelper.instance.getConsultas();
    _consultas.clear();
    _consultas.addAll(dados);
    notifyListeners();
  }

  Future<void> adicionarConsulta(Consulta consulta) async {
    await DatabaseHelper.instance.insertConsulta(consulta);
    await carregarConsultas();
  }

  Future<void> atualizarConsulta(Consulta consulta) async {
    await DatabaseHelper.instance.updateConsulta(consulta);
    await carregarConsultas();
  }

  Future<void> removerConsulta(int id) async {
    await DatabaseHelper.instance.deleteConsulta(id);
    await carregarConsultas();
  }

  List<Consulta> buscarConsultasPorPaciente(int pacienteId) {
    return _consultas.where((c) => c.pacienteId == pacienteId).toList();
  }
}

class DatabaseHelper {
  static var instance;
}
