//classe para controle dos livros
import 'package:biblioteca_app/models/livro.dart';
import 'package:biblioteca_app/services/api_service.dart';

class LivroController {
  //métodos
  //Get do livro
  Future<List<Livro>> fetchAll() async {
    //pega a lista de livros no formato List<dynamic>
    final list = await ApiService.getList("livros?_sort=titulo");
    //retornar a Lista de Livros Convertidas
    return list.map((item) => Livro.fromJson(item)).toList();
  }

  //Get de um unico Livro
  Future<Livro> fetchOne(String id) async {
    final livro = await ApiService.getOne("livro", id);
    return Livro.fromJson(livro);
  }

  //Post -> Criar um Novo livro
  Future<Livro> create(Livro livro) async {
    final created = await ApiService.post("livro", livro.toJson());
    return Livro.fromJson(created);
  }

  //Put -> Alterar um Livro
  Future<Livro> update(Livro livro) async {
    final updated = await ApiService.put("livro", livro.toJson(), livro.id as String);
    return Livro.fromJson(updated);
  }

  // Delete -> Deletar um Livro
  Future<void> delete(String id) async {
    await ApiService.delete("livro", id);
  }
}
