/// Modelo de dados para um Livro
class Livro {
	final int id;
	final String titulo;
	final String autor;
	final String editora;
	final int anoPublicacao;
	final String isbn;
	final int quantidade;

	Livro({
		required this.id,
		required this.titulo,
		required this.autor,
		required this.editora,
		required this.anoPublicacao,
		required this.isbn,
		required this.quantidade,
	});

	factory Livro.fromJson(Map<String, dynamic> json) {
		return Livro(
			id: json['id'],
			titulo: json['titulo'],
			autor: json['autor'],
			editora: json['editora'],
			anoPublicacao: json['anoPublicacao'],
			isbn: json['isbn'],
			quantidade: json['quantidade'],
		);
	}

	Map<String, dynamic> toJson() {
		return {
			'id': id,
			'titulo': titulo,
			'autor': autor,
			'editora': editora,
			'anoPublicacao': anoPublicacao,
			'isbn': isbn,
			'quantidade': quantidade,
		};
	}
}