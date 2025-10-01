import 'package:jupyter/domain/entities/login/login.dart';
import 'package:jupyter/domain/entities/login/usuario.dart';

abstract class LoginRepository {
  Future<Usuario> login(Login login);
  Future<Usuario> registrarUsuario(Login login);
  Future<void> logout();
}
