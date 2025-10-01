import 'package:jupyter/data/database/dao/login_dao.dart';
import 'package:jupyter/data/mappers/login_map.dart';
import 'package:jupyter/domain/entities/login/login.dart';
import 'package:jupyter/domain/entities/login/usuario.dart';
import 'package:jupyter/domain/errors/login_exception.dart';
import 'package:jupyter/domain/repositories/login_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginDao _dao;

  LoginRepositoryImpl(this._dao);

  @override
  Future<Usuario> login(Login login) async {
    try {
      final model = LoginMap.toModel(login);
      final userModel = await _dao.login(model);
      return userModel.toEntity();
    } on AuthException catch (e) {
      throw LoginFailure(message: e.message);
    } catch (e) {
      throw LoginFailure(message: 'Erro inesperado ao fazer login');
    }
  }

  @override
  Future<Usuario> registrarUsuario(Login login) async {
    try {
      final model = LoginMap.toModel(login);
      final userModel = await _dao.registrarUsuario(model);
      return userModel.toEntity();
    } on AuthException catch (e) {
      throw RegisterFailure(message: e.message);
    } catch (e) {
      throw RegisterFailure(message: 'Erro inesperado ao registrar usuário');
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _dao.logout();
    } catch (e) {
      throw LogoutFailure(message: 'Erro ao fazer logout');
    }
  }
}
