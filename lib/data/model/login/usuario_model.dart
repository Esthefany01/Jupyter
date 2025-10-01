import 'package:jupyter/domain/entities/login/usuario.dart';

class UsuarioModel {
  final String id;
  final String email;
  final String? nome;

  UsuarioModel({
    required this.id,
    required this.email,
    this.nome,
  });

  factory UsuarioModel.fromMap(Map<String, dynamic> map) {
    return UsuarioModel(
      id: map['id'] as String,
      email: map['email'] as String,
      nome: map['nome'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'nome': nome,
    };
  }

  // Mapper para entidade
  Usuario toEntity() => Usuario(
        id: id,
        email: email,
        nome: nome,
      );

  // Mapper de entidade para model
  factory UsuarioModel.fromEntity(Usuario usuario) {
    return UsuarioModel(
      id: usuario.id,
      email: usuario.email,
      nome: usuario.nome,
    );
  }
}
