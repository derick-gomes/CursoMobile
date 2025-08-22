// classe para o controller dos usuarios

import 'package:biblioteca_app/models/user.dart';
import 'package:biblioteca_app/services/api_service.dart';

class UsuarioController {
  //metodos 
  //get do usuario
  Future<Usuario?> getUsuario(String id) async {
    final List = await ApiService.getList("usuarios?_sort=nome");
    return List.firstWhere((user) => user.id == id, orElse: () => null);
  }
}