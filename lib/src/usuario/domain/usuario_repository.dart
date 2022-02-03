import 'package:scrumpoker/src/usuario/domain/usuario.dart';

abstract class UsuarioRepository {
  Future<List<Usuario>> getTodosUsuarios();
  Future<Usuario> getUsuarioPorHash(String hash);
  Future<Usuario> getUsuarioPorEmail(String email);
  Future<Usuario> getUsuarioPorEmailESenha(String email, String senha);
  Future<bool> inserir(Usuario usuario);
  Future<bool> atualizar(Usuario usuario);
  // Future<Usuario> logar(Usuario usuario);
  // Future<Usuario> deslogar(Usuario usuario);
  // Future<String> uploadFotoUsuario(File arquivo);
  // Future<bool> utilizaConvite(String hashSala, String hashUsuario);
}
