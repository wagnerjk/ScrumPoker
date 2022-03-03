import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:scrumpoker/src/sala/domain/sala.dart';

void main() {
  test('DEVE retornar uma Sala quando passar os dados por construtor', () async {
    final listaParticipantes = ['123456abcdef'];
    final salaCriada = Sala(descricao: 'Sala A', hashCriador: '123456abcdef', hashsParticipantes: listaParticipantes, votacaoConcluida: false);
    expect(salaCriada, isA<Sala>());
    expect(salaCriada.descricao.isNotEmpty, true);
    expect(salaCriada.hashCriador.isNotEmpty, true);
    expect(salaCriada.hashsParticipantes.isNotEmpty, true);
  });
  test('DEVE retornar um Map quando realizar a conversão através do toMap', () async {
    final listaParticipantes = ['123456abcdef'];
    final salaCriada = Sala(descricao: 'Sala A', hashCriador: '123456abcdef', hashsParticipantes: listaParticipantes, votacaoConcluida: false);
    final mapSala = salaCriada.toMap();
    expect(mapSala, isA<Map>());
    expect(mapSala['descricao'].isNotEmpty, true);
    expect(mapSala['hashCriador'].isNotEmpty, true);
    expect(mapSala['hashsParticipantes'].isNotEmpty, true);
    expect(mapSala['votacaoConcluida'], false);
  });
  test('DEVE retornar um objeto Sala quando realizar a conversão através do fromMap', () async {
    final mapSala = {
      'descricao': 'Teste',
      'hashCriador': 'teste@teste.com',
      'hashsParticipantes': ['123456abcdef'],
      'votacaoConcluida': false,
    };
    final salaCriada = Sala.fromMap(mapSala);
    expect(salaCriada, isA<Sala>());
    expect(salaCriada.descricao.isNotEmpty, true);
    expect(salaCriada.hashCriador.isNotEmpty, true);
    expect(salaCriada.hashsParticipantes.isNotEmpty, true);
    expect(salaCriada.hashsParticipantes.length, 1);
    expect(salaCriada.votacaoConcluida, false);
  });
  test('DEVE retornar um objeto Sala quando realizar a conversão através do fromJson', () async {
    final jsonSala = {
      'descricao': 'Teste',
      'hashCriador': 'teste@teste.com',
      'hashsParticipantes': ['123456abcdef'],
      'votacaoConcluida': false,
    };
    final salaCriada = Sala.fromJson(jsonEncode(jsonSala));
    expect(salaCriada, isA<Sala>());
    expect(salaCriada.descricao.isNotEmpty, true);
    expect(salaCriada.hashCriador.isNotEmpty, true);
    expect(salaCriada.hashsParticipantes.isNotEmpty, true);
    expect(salaCriada.hashsParticipantes.length, 1);
    expect(salaCriada.votacaoConcluida, false);
  });
  test('DEVE retornar uma String quando realizar a conversão através do toJson', () async {
    final listaParticipantes = ['123456abcdef'];
    final salaCriada = Sala(descricao: 'Sala A', hashCriador: '123456abcdef', hashsParticipantes: listaParticipantes, votacaoConcluida: false);
    final jsonSala = salaCriada.toJson();
    expect(jsonSala, isA<String>());
    expect(jsonSala.isNotEmpty, true);
    expect(jsonSala, '{"descricao":"Sala A","hashCriador":"123456abcdef","hashsParticipantes":["123456abcdef"],"votacaoConcluida":false}');
  });
  test('DEVE retornar uma String quando realizar a conversão através do toString', () async {
    final listaParticipantes = ['123456abcdef'];
    final salaCriada = Sala(descricao: 'Sala A', hashCriador: '123456abcdef', hashsParticipantes: listaParticipantes, votacaoConcluida: false);
    final stringSala = salaCriada.toString();
    expect(stringSala, isA<String>());
    expect(stringSala.isNotEmpty, true);
    expect(stringSala, 'Sala(descricao: Sala A, hashCriador: 123456abcdef, hashsParticipantes: [123456abcdef], votacaoConcluida: false)');
  });
  test('DEVE retornar um int quando obtermos o hashCode', () async {
    final listaParticipantes = ['123456abcdef'];
    final salaCriada = Sala(descricao: 'Sala A', hashCriador: '123456abcdef', hashsParticipantes: listaParticipantes, votacaoConcluida: false);
    final hashCode = salaCriada.hashCode;
    expect(hashCode, isA<int>());
    expect(hashCode, isNonNegative);
    expect(hashCode, isPositive);
    expect(hashCode, 319373563);
  });
  test('DEVE retornar fazer as comparações de igual ==', () async {
    final listaParticipantes = ['123456abcdef'];
    final salaCriadaA = Sala(descricao: 'Sala A', hashCriador: '123456abcdef', hashsParticipantes: listaParticipantes, votacaoConcluida: false);
    final listaParticipantesB = ['123456abcdef222'];
    final salaCriadaB = Sala(descricao: 'Sala A', hashCriador: '123456abcdef', hashsParticipantes: listaParticipantesB, votacaoConcluida: true);
    final comparacaoA = salaCriadaA == salaCriadaA;
    final comparacaoAB = salaCriadaA == salaCriadaB;
    expect(comparacaoA, isA<bool>());
    expect(comparacaoAB, isA<bool>());
    expect(comparacaoA, true);
    expect(comparacaoAB, false);
  });
}
