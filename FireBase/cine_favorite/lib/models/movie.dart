// class de modelage do obj Movie
//receberao os dados da API -> enviar os dados para Firesstore

class Movie {
  //atributos 
  final int id; //id do filme do tmdb
  final String title; //título do filme
  final String posterPath; //caminho da imagem do Poster (path de armazenamento interno)
  double rating; //nota que o usuario dara o filme (0 a 5)

  //construtor
  Movie({
    required this.id,
    required this.title,
    required this.posterPath,
    this.rating = 0.0,
  });

  //métodos de conversao do obj <=> JSON
  //TO MAP obj json
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'posterPath': posterPath,
      'rating': rating,
    };
  }

  //FROM MAP json obj
  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id'],
      title: map['title'],
      posterPath: map['posterPath'],
      rating: map['rating']?.toDouble() ?? 0.0,
    );
  }
}
