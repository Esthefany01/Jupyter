import 'package:jupyter/data/model/login/login_model.dart';
import 'package:jupyter/domain/entities/login/login.dart';

class LoginMap {
  static LoginModel toModel(Login entity) {
    return LoginModel(
      email: entity.email,
      password: entity.password,
      nome: entity.nome,
    );
  }
}
