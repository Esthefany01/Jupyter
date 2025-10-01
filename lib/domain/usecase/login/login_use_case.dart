import 'package:jupyter/domain/entities/login/login.dart';
import 'package:jupyter/domain/entities/login/usuario.dart';
import 'package:jupyter/domain/repositories/login_repository.dart';

class LoginUseCase {
  final LoginRepository _repository;

  LoginUseCase(this._repository);

  Future<Usuario> call(Login login) async {
    return await _repository.login(login);
  }
}
