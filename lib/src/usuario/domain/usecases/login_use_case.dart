import 'package:scrumpoker/src/usuario/domain/usuario.dart';
import 'package:scrumpoker/src/usuario/domain/usuario_repository.dart';

/// Abstração para caso de uso de login
abstract class LoginUseCase {
  Future<Usuario> execute(Usuario usuario);
}

/// Implementação concreta de caso de uso de login
class LoginUseCaseImpl implements LoginUseCase {
  /// Repositório de usuário
  UsuarioRepository usuarioRepository;

  /// Construtor
  LoginUseCaseImpl(this.usuarioRepository);

  @override
  Future<Usuario> execute(Usuario usuario) async {
    assert(usuario.senha != null);
    return await usuarioRepository.getUsuarioPorEmailESenha(usuario.email, usuario.senha!);
  }
}
