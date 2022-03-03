import 'package:flutter_test/flutter_test.dart';
import 'package:scrumpoker/src/usuario/domain/usuario.dart';
import 'package:scrumpoker/src/usuario/domain/usuario_repository.dart';
import 'package:scrumpoker/src/usuario/infra/usuario_repository_mock.dart';

void main() {
  late UsuarioRepository usuarioRepositoryMock;

  setUpAll(() {
    usuarioRepositoryMock = UsuarioRepositoryMock();
  });
  test('DEVE retornar todos os usuários quando solicitado', () async {
    final listaUsuarios = await usuarioRepositoryMock.getTodosUsuarios();
    expect(listaUsuarios, isA<List<Usuario>>());
    expect(listaUsuarios.length, 1);
  });

  test('DEVE retornar o usuário quando uma hash for passada', () async {
    final usuario = await usuarioRepositoryMock.getUsuarioPorHash('111');
    expect(usuario, isA<Usuario>());
    expect(usuario.nome, 'Usuário Válido');
  });

  test('DEVE retornar o usuário quando um e-mail for passado', () async {
    final usuario = await usuarioRepositoryMock.getUsuarioPorEmail('usuario@valido.com');
    expect(usuario, isA<Usuario>());
    expect(usuario.nome, 'Usuário Válido');
  });

  test('DEVE retornar o usuário quando um e-mail e senha forem passados', () async {
    final usuario = await usuarioRepositoryMock.getUsuarioPorEmailESenha('usuario@valido.com', '123456');
    expect(usuario, isA<Usuario>());
    expect(usuario.nome, 'Usuário Válido');
  });

  test('DEVE retornar true quando o usuario for inserido', () async {
    final novoUsuario = Usuario(hash: 'qwerty', nome: 'Novo usuario', email: 'emailnovousuario@teste.com');
    final inseriu = await usuarioRepositoryMock.inserir(novoUsuario);
    expect(inseriu, isA<bool>());
    expect(inseriu, true);
  });

  test('DEVE retornar true quando o usuario for alterado', () async {
    final novoUsuario = Usuario(hash: 'qwerty', nome: 'Novo usuario alterado', email: 'emailnovousuario@teste.com');
    final alterou = await usuarioRepositoryMock.atualizar(novoUsuario);
    expect(alterou, isA<bool>());
    expect(alterou, true);
  });

  test('DEVE retornar false quando o usuario não possuir hash para ser alterado', () async {
    final novoUsuario = Usuario(nome: 'Novo usuario alterado', email: 'emailnovousuario@teste.com');
    final alterou = await usuarioRepositoryMock.atualizar(novoUsuario);
    expect(alterou, isA<bool>());
    expect(alterou, false);
  });
}
