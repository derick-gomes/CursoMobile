//classe para emprestimo de livro
import 'package:biblioteca_app/models/emprestimo.dart';
import 'package:biblioteca_app/services/api_service.dart';

class EmprestimoController {
  //métodos
  //Get do emprestimo
  Future<List<Emprestimo>> fetchAll() async {
    //pega a lista de emprestimos no formato List<dynamic>
    final list = await ApiService.getList("emprestimos?_sort=dataEmprestimo");
    //retornar a Lista de Emprestimos Convertidas
    return list.map((item) => Emprestimo.fromJson(item)).toList();
  }

  //Get de um unico Emprestimo
  Future<Emprestimo> fetchOne(String id) async {
    final emprestimo = await ApiService.getOne("emprestimo", id);
    return Emprestimo.fromJson(emprestimo);
  }

  //Post -> Criar um Novo emprestimo
  Future<Emprestimo> create(Emprestimo emprestimo) async {
    final created = await ApiService.post("emprestimo", emprestimo.toJson());
    return Emprestimo.fromJson(created);
  }

  //Put -> Alterar um Emprestimo
  Future<Emprestimo> update(Emprestimo emprestimo) async {
    final updated = await ApiService.put("emprestimo", emprestimo.toJson(), emprestimo.id as String);
    return Emprestimo.fromJson(updated);
  }

  // Delete -> Deletar um Emprestimo
  Future<void> delete(String id) async {
    await ApiService.delete("emprestimo", id);
  }
}
