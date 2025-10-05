class LoginModel {
  String? email;
  String? password;
  String? nome;

  LoginModel({
    this.email,
    this.password,
    this.nome,
  });

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      nome: map['nome'] != null ? map['nome'] as String : null,
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
