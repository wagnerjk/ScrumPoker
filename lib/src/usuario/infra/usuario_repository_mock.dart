import 'package:scrumpoker/src/usuario/domain/usuario.dart';
import 'package:scrumpoker/src/usuario/domain/usuario_repository.dart';

/// Implementação de repositório mock para a entidade Usuário
class UsuarioRepositoryMock implements UsuarioRepository {
  /// .
  /// Lista dos usuários mockados que representa a tabela/collection
  final listaUsuarios = <Usuario>[
    Usuario(
      hash: '111',
      nome: 'Usuário Válido',
      email: 'usuario@valido.com',
      senha: '123456',
    ),
  ];

  /// Obtém todos os usuários
  @override
  Future<List<Usuario>> getTodosUsuarios() async {
    return listaUsuarios;
  }

  @override
  Future<Usuario> getUsuarioPorHash(String hash) async {
    return listaUsuarios.firstWhere((usuario) => usuario.hash == hash, orElse: () => UsuarioVazio());
  }

  @override
  Future<Usuario> getUsuarioPorEmail(String email) async {
    return listaUsuarios.firstWhere((usuario) => usuario.email == email, orElse: () => UsuarioVazio());
  }

  @override
  Future<Usuario> getUsuarioPorEmailESenha(String email, String senha) async {
    return listaUsuarios.firstWhere((usuario) => usuario.email == email && usuario.senha == senha, orElse: () => UsuarioVazio());
  }

  @override
  Future<bool> inserir(Usuario usuario) async {
    final usuarioPesquisa = await getUsuarioPorEmail(usuario.email);
    if (usuarioPesquisa is UsuarioVazio) {
      listaUsuarios.add(usuario);
      return true;
    }
    return false;
  }

  @override
  Future<bool> atualizar(Usuario usuario) async {
    if (usuario.hash == null) {
      return false;
    }
    final usuarioPesquisa = await getUsuarioPorHash(usuario.hash!);
    if (usuarioPesquisa is UsuarioVazio) {
      return false;
    }
    listaUsuarios.removeWhere((usuarioCorrente) => usuarioCorrente.hash == usuario.hash);
    await inserir(usuario);
    return true;
  }
}
