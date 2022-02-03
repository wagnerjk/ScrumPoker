import 'package:scrumpoker/src/sala/domain/sala.dart';

abstract class SalaRepository {
  Future<Sala> getSalaPorHash(String hashSala);
  Future<bool> salaExiste(String hashSala);
  Future<void> cadastrarSala(Sala sala);
  Future<void> apagarSala(Sala sala);
  Future<List<Sala>> getTodasSalas();
}
