// @dart=2.9
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:scrumpoker/models/cartas_enum.dart';

/// Classe que representa o modelo da entidade Sala
class Sala {
  String descricao;
  String hashCriador;
  List<String> hashsParticipantes;
  bool votacaoConcluida;
  List<CartasEnum> cartasSala;

  /// Construtor
  Sala({
    this.descricao,
    this.hashCriador,
    this.hashsParticipantes,
    this.votacaoConcluida,
    this.cartasSala,
  });

  Sala copyWith({
    String descricao,
    String hashCriador,
    List<String> hashsParticipantes,
    bool votacaoConcluida,
    List<CartasEnum> cartasSala,
  }) {
    return Sala(
      descricao: descricao ?? this.descricao,
      hashCriador: hashCriador ?? this.hashCriador,
      hashsParticipantes: hashsParticipantes ?? this.hashsParticipantes,
      votacaoConcluida: votacaoConcluida ?? this.votacaoConcluida,
      cartasSala: cartasSala ?? this.cartasSala,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'descricao': descricao,
      'hashCriador': hashCriador,
      'hashsParticipantes': hashsParticipantes,
      'votacaoConcluida': votacaoConcluida,
      'cartasSala': cartasSala.map((carta) => carta.numero).toList(),
    };
  }

  factory Sala.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Sala(
      descricao: map['descricao'],
      hashCriador: map['hashCriador'],
      hashsParticipantes: List<String>.from(map['hashsParticipantes']),
      votacaoConcluida: map['votacaoConcluida'],
      cartasSala: map['cartasSala'] != null
          ? (map['cartasSala'] as List).map((e) => CartasEnum.values.firstWhere((c) => c.numero == e)).toList()
          : <CartasEnum>[],
    );
  }

  String toJson() => json.encode(toMap());

  factory Sala.fromJson(String source) => Sala.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Sala(descricao: $descricao, hashCriador: $hashCriador, hashsParticipantes: $hashsParticipantes, votacaoConcluida: $votacaoConcluida, cartasSala: $cartasSala)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Sala &&
        other.descricao == descricao &&
        other.hashCriador == hashCriador &&
        listEquals(other.hashsParticipantes, hashsParticipantes) &&
        other.votacaoConcluida == votacaoConcluida &&
        listEquals(other.cartasSala, cartasSala);
  }

  @override
  int get hashCode {
    return descricao.hashCode ^ hashCriador.hashCode ^ hashsParticipantes.hashCode ^ votacaoConcluida.hashCode ^ cartasSala.hashCode;
  }
}
