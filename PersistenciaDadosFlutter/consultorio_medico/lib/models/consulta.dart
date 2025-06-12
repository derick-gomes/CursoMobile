class Consulta {
  final int? id;
  final int pacienteId;
  final String data;
  final String hora;
  final String especialidade;
  final String observacoes;
  final String status;

  Consulta({
    this.id,
    required this.pacienteId,
    required this.data,
    required this.hora,
    required this.especialidade,
    required this.observacoes,
    this.status = "Agendada",
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'pacienteId': pacienteId,
      'data': data,
      'hora': hora,
      'especialidade': especialidade,
      'observacoes': observacoes,
      'status': status,
    };
  }

  factory Consulta.fromMap(Map<String, dynamic> map) {
    return Consulta(
      id: map['id'],
      pacienteId: map['pacienteId'],
      data: map['data'],
      hora: map['hora'],
      especialidade: map['especialidade'],
      observacoes: map['observacoes'],
      status: map['status'],
    );
  }
}
