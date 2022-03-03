import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:scrumpoker/src/votacao/domain/votacao.dart';

void main() {
  test('DEVE retornar uma Votacao quando passar os dados por construtor', () async {
    final votacaoCriada = Votacao(hashSala: 'abc123', hashUsuario: '123456abcdef');
    expect(votacaoCriada, isA<Votacao>());
    expect(votacaoCriada.hashSala.isNotEmpty, true);
    expect(votacaoCriada.hashUsuario.isNotEmpty, true);
  });
  test('DEVE retornar um Map quando realizar a conversão através do toMap', () async {
    final votacaoCriada = Votacao(hashSala: 'abc123', hashUsuario: '123456abcdef');
    final mapVotacao = votacaoCriada.toMap();
    expect(mapVotacao, isA<Map>());
    expect(mapVotacao['hashSala'].isNotEmpty, true);
    expect(mapVotacao['hashUsuario'].isNotEmpty, true);
  });
  test('DEVE retornar um objeto Votacao quando realizar a conversão através do fromMap', () async {
    final mapVotacao = {'hashSala': 'abc123', 'hashUsuario': '123456abcdef'};
    final votacaoCriada = Votacao.fromMap(mapVotacao);
    expect(votacaoCriada, isA<Votacao>());
    expect(votacaoCriada.hashSala.isNotEmpty, true);
    expect(votacaoCriada.hashUsuario.isNotEmpty, true);
  });
  test('DEVE retornar um objeto Votacao quando realizar a conversão através do fromJson', () async {
    final json = {
      'hashSala': 'abc123',
      'hashUsuario': '123456abcdef',
    };
    final votacaoCriada = Votacao.fromJson(jsonEncode(json));
    expect(votacaoCriada, isA<Votacao>());
    expect(votacaoCriada.hashSala.isNotEmpty, true);
    expect(votacaoCriada.hashUsuario.isNotEmpty, true);
  });
  test('DEVE retornar uma String quando realizar a conversão através do toJson', () async {
    final votacaoCriada = Votacao(hashSala: 'abc123', hashUsuario: '123456abcdef');
    final json = votacaoCriada.toJson();
    expect(json, isA<String>());
    expect(json.isNotEmpty, true);
    expect(json, '{"hashSala":"abc123","hashUsuario":"123456abcdef","nota":null}');
  });
  test('DEVE retornar uma String quando realizar a conversão através do toString', () async {
    final votacaoCriada = Votacao(hashSala: 'abc123', hashUsuario: '123456abcdef');
    final stringSala = votacaoCriada.toString();
    expect(stringSala, isA<String>());
    expect(stringSala.isNotEmpty, true);
    expect(stringSala, 'Votacao(hashSala: abc123, hashUsuario: 123456abcdef, nota: null)');
  });
  test('DEVE retornar um int quando obtermos o hashCode', () async {
    final votacaoCriada = Votacao(hashSala: 'abc123', hashUsuario: '123456abcdef');
    final hashCode = votacaoCriada.hashCode;
    expect(hashCode, isA<int>());
    expect(hashCode, isNonNegative);
    expect(hashCode, isPositive);
    expect(hashCode, 1068123557);
  });
  test('DEVE retornar fazer as comparações de igual ==', () async {
    final objCriadoA = Votacao(hashSala: 'Sala A', hashUsuario: '123456abcdef', nota: 0);
    final objCriadoB = Votacao(hashSala: 'Sala A', hashUsuario: '123456abcdef', nota: 13);
    final comparacaoA = objCriadoA == objCriadoA;
    final comparacaoAB = objCriadoA == objCriadoB;
    expect(comparacaoA, isA<bool>());
    expect(comparacaoAB, isA<bool>());
    expect(comparacaoA, true);
    expect(comparacaoAB, false);
  });
}
