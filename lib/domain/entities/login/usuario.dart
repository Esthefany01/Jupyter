class Usuario {
  final String id;
  final String email;
  final String? nome;

  Usuario({
    required this.id,
    required this.email,
    this.nome,
  });
}
