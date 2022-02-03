import 'dart:convert';

/// Representa o usuário do aplicativo
class Usuario {
  String nome;
  String email;
  String? hash;
  String? urlFoto;
  String? senha;

  /// Construtor
  Usuario({
    required this.nome,
    required this.email,
    this.hash,
    this.urlFoto,
    this.senha,
  });

  Usuario copyWith({
    String? nome,
    String? email,
    String? hash,
    String? urlFoto,
    String? senha,
  }) {
    return Usuario(
      nome: nome ?? this.nome,
      email: email ?? this.email,
      hash: hash ?? this.hash,
      urlFoto: urlFoto ?? this.urlFoto,
      senha: senha ?? this.senha,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'email': email,
      'hash': hash,
      'urlFoto': urlFoto,
      'senha': senha,
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      nome: map['nome'] ?? '',
      email: map['email'] ?? '',
      hash: map['hash'],
      urlFoto: map['urlFoto'],
      senha: map['senha'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Usuario.fromJson(String source) => Usuario.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Usuario(nome: $nome, email: $email, hash: $hash, urlFoto: $urlFoto, senha: $senha)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Usuario && other.nome == nome && other.email == email && other.hash == hash && other.urlFoto == urlFoto && other.senha == senha;
  }

  @override
  int get hashCode {
    return nome.hashCode ^ email.hashCode ^ hash.hashCode ^ urlFoto.hashCode ^ senha.hashCode;
  }
}

/// Representa um usuário vazio a fim de evitar retornos nulos
class UsuarioVazio extends Usuario {
  /// Construtor
  UsuarioVazio() : super(hash: '', nome: '', email: '');
}
