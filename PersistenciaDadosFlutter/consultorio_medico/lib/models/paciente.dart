class Paciente {
  final int? id;
  final String nome;
  final String cpf;
  final String dataNascimento;
  final String telefone;
  final String email;

  Paciente({
    this.id,
    required this.nome,
    required this.cpf,
    required this.dataNascimento,
    required this.telefone,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'cpf': cpf,
      'dataNascimento': dataNascimento,
      'telefone': telefone,
      'email': email,
    };
  }

  factory Paciente.fromMap(Map<String, dynamic> map) {
    return Paciente(
      id: map['id'],
      nome: map['nome'],
      cpf: map['cpf'],
      dataNascimento: map['dataNascimento'],
      telefone: map['telefone'],
      email: map['email'],
    );
  }
}
