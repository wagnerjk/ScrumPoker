import 'package:flutter_test/flutter_test.dart';
import 'package:scrumpoker/src/usuario/domain/usecases/logout_use_case.dart';
import 'package:scrumpoker/src/usuario/domain/usuario.dart';
import 'package:scrumpoker/src/usuario/infra/usuario_repository_mock.dart';

void main() {
  final usuarioRepository = UsuarioRepositoryMock();
  var logoutUseCase = LogoutUseCaseImpl(usuarioRepository);
  var usuarioValido = Usuario(
    hash: '111',
    nome: 'Usuário Válido',
    email: 'usuario@valido.com',
    senha: '123456',
  );
  var usuarioInvalido = Usuario(
    hash: '222',
    nome: 'Usuário Inválido',
    email: 'usuario@invalido.com',
    senha: '123456',
  );

  test('DEVE retornar VERDADEIRO quando logout for bem sucedido', () async {
    final usuarioLogado = await logoutUseCase.execute(usuarioValido);
    expect(usuarioLogado, isA<Usuario>());
    expect(usuarioLogado.hash!.isNotEmpty, true);
    expect(usuarioLogado.email, usuarioValido.email);
  });
  test('DEVE retornar um usuário vazio quando o usuário não for encontrado', () async {
    final usuarioLogado = await logoutUseCase.execute(usuarioInvalido);
    expect(usuarioLogado, isA<UsuarioVazio>());
    expect(usuarioLogado.hash!.isEmpty, true);
    expect(usuarioLogado.nome.isEmpty, true);
    expect(usuarioLogado.email.isEmpty, true);
  });
}
