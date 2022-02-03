import 'package:scrumpoker/src/usuario/domain/usuario.dart';
import 'package:scrumpoker/src/usuario/domain/usuario_repository.dart';

/// Abstração para caso de uso de logout
abstract class LogoutUseCase {
  Future<Usuario> execute(Usuario usuario);
}

/// Implementação concreta de caso de uso de logout
class LogoutUseCaseImpl implements LogoutUseCase {
  /// Repositório de usuário
  UsuarioRepository usuarioRepository;

  /// Construtor
  LogoutUseCaseImpl(this.usuarioRepository);

  @override
  Future<Usuario> execute(Usuario usuario) async {
    assert(usuario.hash != null);
    return await usuarioRepository.getUsuarioPorHash(usuario.hash!);
  }
}
