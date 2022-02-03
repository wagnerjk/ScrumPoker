import 'dart:convert';

import 'package:flutter/foundation.dart';

class Sala {
  String descricao;
  String hashCriador;
  List<String> hashsParticipantes;
  bool votacaoConcluida;

  /// Construtor
  Sala({
    required this.descricao,
    required this.hashCriador,
    required this.hashsParticipantes,
    required this.votacaoConcluida,
  });

  Sala copyWith({
    String? descricao,
    String? hashCriador,
    List<String>? hashsParticipantes,
    bool? votacaoConcluida,
  }) {
    return Sala(
      descricao: descricao ?? this.descricao,
      hashCriador: hashCriador ?? this.hashCriador,
      hashsParticipantes: hashsParticipantes ?? this.hashsParticipantes,
      votacaoConcluida: votacaoConcluida ?? this.votacaoConcluida,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'descricao': descricao,
      'hashCriador': hashCriador,
      'hashsParticipantes': hashsParticipantes,
      'votacaoConcluida': votacaoConcluida,
    };
  }

  factory Sala.fromMap(Map<String, dynamic> map) {
    return Sala(
      descricao: map['descricao'] ?? '',
      hashCriador: map['hashCriador'] ?? '',
      hashsParticipantes: List<String>.from(map['hashsParticipantes']),
      votacaoConcluida: map['votacaoConcluida'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Sala.fromJson(String source) => Sala.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Sala(descricao: $descricao, hashCriador: $hashCriador, hashsParticipantes: $hashsParticipantes, votacaoConcluida: $votacaoConcluida)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Sala &&
        other.descricao == descricao &&
        other.hashCriador == hashCriador &&
        listEquals(other.hashsParticipantes, hashsParticipantes) &&
        other.votacaoConcluida == votacaoConcluida;
  }

  @override
  int get hashCode {
    return descricao.hashCode ^ hashCriador.hashCode ^ hashsParticipantes.hashCode ^ votacaoConcluida.hashCode;
  }
}
