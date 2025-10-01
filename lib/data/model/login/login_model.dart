class LoginModel {
  final String email;
  final String password;
  final String nome;

  LoginModel({
    required this.email,
    required this.password,
    required this.nome,
  });

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      email: map['email'] as String,
      password: map['password'] as String,
      nome: map['nome'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'nome': nome,
    };
  }
}
