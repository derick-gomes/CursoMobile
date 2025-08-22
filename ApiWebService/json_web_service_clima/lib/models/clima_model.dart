//classe para modelagem de dados da API de clima

class Clima {
  //atributos 
  final String nome; //nome da cidade 
  final double temperatura; //temperatura em graus Celsius
  final String descricao; //descrição do clima

  //contrutor
  Clima({required this.nome, required this.temperatura, required this.descricao});

 //fromJson
 //factory (contrutor direncionado para a modelagem)
 factory Clima.fromJson(Map<String, dynamic> json) {
    return Clima(
      nome: json['name'],
      temperatura: json['main']['temp'] - 273.15, //conversão de Kelvin para Celsius
      descricao: json['weather'][0]['description'],
    );
  }

}