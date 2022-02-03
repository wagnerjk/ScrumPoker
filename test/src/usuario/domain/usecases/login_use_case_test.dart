import 'package:flutter_test/flutter_test.dart';
import 'package:scrumpoker/src/usuario/domain/usecases/login_use_case.dart';
import 'package:scrumpoker/src/usuario/domain/usuario.dart';
import 'package:scrumpoker/src/usuario/infra/usuario_repository_mock.dart';

void main() {
  final usuarioRepository = UsuarioRepositoryMock();
  var loginUseCase = LoginUseCaseImpl(usuarioRepository);
  var usuarioValido = Usuario(
    nome: 'Usuário Válido',
    email: 'usuario@valido.com',
    senha: '123456',
  );
  var usuarioInvalido = Usuario(
    nome: 'Usuário Inválido',
    email: 'usuario@invalido.com',
    senha: '123456',
  );

  test('DEVE retornar VERDADEIRO quando login for bem sucedido', () async {
    final usuarioLogado = await loginUseCase.execute(usuarioValido);
    expect(usuarioLogado, isA<Usuario>());
    expect(usuarioLogado.hash!.isNotEmpty, true);
    expect(usuarioLogado.email, usuarioValido.email);
    expect(usuarioLogado.senha, usuarioValido.senha);
  });
  test('DEVE retornar um usuário vazio quando o usuário não for encontrado', () async {
    final usuarioLogado = await loginUseCase.execute(usuarioInvalido);
    expect(usuarioLogado, isA<UsuarioVazio>());
    expect(usuarioLogado.hash!.isEmpty, true);
    expect(usuarioLogado.nome.isEmpty, true);
    expect(usuarioLogado.email.isEmpty, true);
  });
}
