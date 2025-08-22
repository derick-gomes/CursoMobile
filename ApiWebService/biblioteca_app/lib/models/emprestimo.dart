class Emprestimo {
  final int id;
  final int livroId;
  final int usuarioId;
  final DateTime dataEmprestimo;
  final DateTime? dataDevolucao;

  Emprestimo({
    required this.id,
    required this.livroId,
    required this.usuarioId,
    required this.dataEmprestimo,
    this.dataDevolucao,
  });

  factory Emprestimo.fromJson(Map<String, dynamic> json) {
    return Emprestimo(
      id: json['id'],
      livroId: json['livroId'],
      usuarioId: json['usuarioId'],
      dataEmprestimo: DateTime.parse(json['dataEmprestimo']),
      dataDevolucao: json['dataDevolucao'] != null
          ? DateTime.parse(json['dataDevolucao'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'livroId': livroId,
      'usuarioId': usuarioId,
      'dataEmprestimo': dataEmprestimo.toIso8601String(),
      'dataDevolucao': dataDevolucao?.toIso8601String(),
    };
  }
}