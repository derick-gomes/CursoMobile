//meu serviço de conexão com a API

import 'package:http/http.dart' as http;

class TmdbService {
  //colocar os dados da API
  static const String _apiKey = "1fa5c2d59029fd1c438cc35713720604";
  static const String _baseURL = "https://api.themoviedb.org/3";
  static const String _idioma = "pt-BR";

  //método para buscar filme com base no texto

  static Future<List<Map<String,dynamic>>> searchMovies(String query) async{
    //converter String em URL
    final apiUrl = Uri.parse("$_baseURL/search/movie?api_key=$_apiKey&query&lenguage=$_idioma");
    // http.get
    final response = await http.get(apiUrl);

    // se resposta form ok ==200
    if(response.statusCode ==200){
      //converter o corpo da resposta em um Map
      final Map<String,dynamic> data =  Map<String,dynamic>.from(json.decode(response.body));
      //extrair a lista de filmes do Map
      final List<dynamic> results = data['results'];
      //converter a lista dinâmica em uma lista de Map<String,dynamic>
      return results.map((item) => Map<String,dynamic>.from(item)).toList();
  }
}