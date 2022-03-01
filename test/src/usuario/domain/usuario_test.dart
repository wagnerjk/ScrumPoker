import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:scrumpoker/src/usuario/domain/usuario.dart';

void main() {
  test('DEVE retornar um usuário quando passar os dados por construtor', () async {
    final usuarioCriado = Usuario(
      nome: 'Teste',
      email: 'teste',
      urlFoto: 'http://www.teste.com/teste.png',
      hash: '123456abcdef',
      senha: '123456',
    );
    expect(usuarioCriado, isA<Usuario>());
    expect(usuarioCriado.nome.isNotEmpty, true);
    expect(usuarioCriado.email.isNotEmpty, true);
    expect(usuarioCriado.urlFoto!.isNotEmpty, true);
    expect(usuarioCriado.hash!.isNotEmpty, true);
    expect(usuarioCriado.senha!.isNotEmpty, true);
  });
  test('DEVE retornar um Map quando realizar a conversão através do toMap', () async {
    final usuarioCriado = Usuario(
      nome: 'Teste',
      email: 'teste',
      urlFoto: 'http://www.teste.com/teste.png',
      hash: '123456abcdef',
      senha: '123456',
    );
    final mapUsuario = usuarioCriado.toMap();
    expect(mapUsuario, isA<Map>());
    expect(mapUsuario['nome'].isNotEmpty, true);
    expect(mapUsuario['email'].isNotEmpty, true);
    expect(mapUsuario['urlFoto'].isNotEmpty, true);
    expect(mapUsuario['hash'].isNotEmpty, true);
    expect(mapUsuario['senha'].isNotEmpty, true);
  });
  test('DEVE retornar um objeto Usuario quando realizar a conversão através do fromMap', () async {
    final mapUsuario = {
      'nome': 'Teste',
      'email': 'teste@teste.com',
      'urlFoto': 'http://www.teste.com/teste.png',
      'hash': '123456abcdef',
      'senha': '123456',
    };
    final usuarioCriado = Usuario.fromMap(mapUsuario);
    expect(usuarioCriado, isA<Usuario>());
    expect(usuarioCriado.nome.isNotEmpty, true);
    expect(usuarioCriado.email.isNotEmpty, true);
    expect(usuarioCriado.urlFoto!.isNotEmpty, true);
    expect(usuarioCriado.hash!.isNotEmpty, true);
    expect(usuarioCriado.senha!.isNotEmpty, true);
  });
  test('DEVE retornar um objeto Usuario quando realizar a conversão através do fromJson', () async {
    final mapUsuario = {
      'nome': 'Teste',
      'email': 'teste@teste.com',
      'urlFoto': 'http://www.teste.com/teste.png',
      'hash': '123456abcdef',
      'senha': '123456',
    };
    final usuarioCriado = Usuario.fromJson(jsonEncode(mapUsuario));
    expect(usuarioCriado, isA<Usuario>());
    expect(usuarioCriado.nome.isNotEmpty, true);
    expect(usuarioCriado.email.isNotEmpty, true);
    expect(usuarioCriado.urlFoto!.isNotEmpty, true);
    expect(usuarioCriado.hash!.isNotEmpty, true);
    expect(usuarioCriado.senha!.isNotEmpty, true);
  });
  test('DEVE retornar uma String quando realizar a conversão através do toJson', () async {
    final usuarioCriado = Usuario(
      nome: 'Teste',
      email: 'teste',
      urlFoto: 'http://www.teste.com/teste.png',
      hash: '123456abcdef',
      senha: '123456',
    );
    final jsonUsuario = usuarioCriado.toJson();
    expect(jsonUsuario, isA<String>());
    expect(jsonUsuario.isNotEmpty, true);
    expect(jsonUsuario, '{"nome":"Teste","email":"teste","hash":"123456abcdef","urlFoto":"http://www.teste.com/teste.png","senha":"123456"}');
  });
  test('DEVE retornar uma String quando realizar a conversão através do toString', () async {
    final usuarioCriado = Usuario(
      nome: 'Teste',
      email: 'teste',
      urlFoto: 'http://www.teste.com/teste.png',
      hash: '123456abcdef',
      senha: '123456',
    );
    final stringUsuario = usuarioCriado.toString();
    expect(stringUsuario, isA<String>());
    expect(stringUsuario.isNotEmpty, true);
    expect(stringUsuario, 'Usuario(nome: Teste, email: teste, hash: 123456abcdef, urlFoto: http://www.teste.com/teste.png, senha: 123456)');
  });
  test('DEVE retornar um int quando obtermos o hashCode', () async {
    final usuarioCriado = Usuario(
      nome: 'Teste',
      email: 'teste',
      urlFoto: 'http://www.teste.com/teste.png',
      hash: '123456abcdef',
      senha: '123456',
    );
    final hashCode = usuarioCriado.hashCode;
    expect(hashCode, isA<int>());
    expect(hashCode, isNonNegative);
    expect(hashCode, isPositive);
    expect(hashCode, 565573933);
  });
  test('DEVE retornar fazer as comparações de igual ==', () async {
    final usuarioCriadoA = Usuario(
      nome: 'Teste',
      email: 'teste',
      urlFoto: 'http://www.teste.com/teste.png',
      hash: '123456abcdef',
      senha: '123456',
    );
    final usuarioCriadoB = Usuario(
      nome: 'TesteB',
      email: 'testeB',
      urlFoto: 'http://www.testeb.com/teste.png',
      hash: '123456abcdefb',
      senha: '123456b',
    );
    final comparacaoUsuarioA = usuarioCriadoA == usuarioCriadoA;
    final comparacaoUsuarioAB = usuarioCriadoA == usuarioCriadoB;
    expect(comparacaoUsuarioA, isA<bool>());
    expect(comparacaoUsuarioAB, isA<bool>());
    expect(comparacaoUsuarioA, true);
    expect(comparacaoUsuarioAB, false);
  });
}
