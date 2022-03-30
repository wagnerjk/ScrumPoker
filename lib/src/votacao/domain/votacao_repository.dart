import 'package:scrumpoker/src/votacao/domain/votacao.dart';

abstract class VotacaoRepository {
  Future<Votacao> getTodasVotacoes();
  Future<Votacao> getVotacaoPorHash(String hashVotacao);
  Future<Votacao> getVotacoesPorSala(String hashSala);
  Future<void> excluirVotacao(String hashSala, String hashUsuario);
  Future<bool> verificaSeTodosDaSalaVotaram(String hashSala);
  Future<void> resetarVotacoes(String hashSala);
  Future<void> votar(String hashSala, String hashUsuario, int nota);
  Future<void> contabilizaVotacoes(String hashSala);
}
