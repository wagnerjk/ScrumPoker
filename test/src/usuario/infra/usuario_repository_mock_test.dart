import 'package:flutter_test/flutter_test.dart';
import 'package:scrumpoker/src/usuario/domain/usuario.dart';
import 'package:scrumpoker/src/usuario/infra/usuario_repository_mock.dart';

void main() {
  test('DEVE retornar todos os usuários quando solicitado', () async {
    final usuarioRepositoryMock = UsuarioRepositoryMock();
    final listaUsuarios = await usuarioRepositoryMock.getTodosUsuarios();
    expect(listaUsuarios, isA<List<Usuario>>());
    expect(listaUsuarios.length, 1);
  });

  test('DEVE retornar o usuário quando uma hash for passada', () async {
    final usuarioRepositoryMock = UsuarioRepositoryMock();
    final usuario = await usuarioRepositoryMock.getUsuarioPorHash('111');
    expect(usuario, isA<Usuario>());
    expect(usuario.nome, 'Usuário Válido');
  });

  test('DEVE retornar o usuário quando um e-mail for passado', () async {
    final usuarioRepositoryMock = UsuarioRepositoryMock();
    final usuario = await usuarioRepositoryMock.getUsuarioPorEmail('usuario@valido.com');
    expect(usuario, isA<Usuario>());
    expect(usuario.nome, 'Usuário Válido');
  });

  test('DEVE retornar o usuário quando um e-mail e senha forem passados', () async {
    final usuarioRepositoryMock = UsuarioRepositoryMock();
    final usuario = await usuarioRepositoryMock.getUsuarioPorEmailESenha('usuario@valido.com', '123456');
    expect(usuario, isA<Usuario>());
    expect(usuario.nome, 'Usuário Válido');
  });
}
