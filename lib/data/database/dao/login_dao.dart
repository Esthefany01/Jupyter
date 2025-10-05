import 'package:jupyter/data/model/login/login_model.dart';
import 'package:jupyter/data/model/login/usuario_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginDao {
  final SupabaseClient _client;

  LoginDao(this._client);

  Future<UsuarioModel> registrarUsuario(LoginModel model) async {
    final response = await _client.auth.signUp(
      email: model.email,
      password: model.password!,
    );

    if (response.user == null) {
      throw const AuthException('Falha ao registrar usuário');
    }

    await _client.from('usuarios').insert({
      'id': response.user!.id,
      'nome': model.nome,
    });

    return UsuarioModel(
      id: response.user!.id,
      email: response.user!.email!,
      usuario: model.nome,
    );
  }

  Future<UsuarioModel> login(LoginModel model) async {
    if (model.email == null || model.email!.isEmpty) {
      throw const AuthException('Email é obrigatório para login');
    }
    if (model.password == null || model.password!.isEmpty) {
      throw const AuthException('Senha é obrigatória para login');
    }

    final response = await _client.auth.signInWithPassword(
      email: model.email!,
      password: model.password!,
    );

    if (response.session == null || response.user == null) {
      throw const AuthException('Falha ao fazer login');
    }

    final data = await _client.from('usuarios').select('nome').eq('id', response.user!.id).maybeSingle();

    if (data == null) {
      throw const AuthException('Usuário não encontrado na tabela interna');
    }

    return UsuarioModel(
      id: response.user!.id,
      email: response.user!.email!,
      usuario: data['nome'] as String,
    );
  }

  Future<void> logout() async {
    await _client.auth.signOut();
  }
}
