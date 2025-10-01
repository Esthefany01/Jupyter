import 'package:jupyter/data/model/login/login_model.dart';
import 'package:jupyter/data/model/login/usuario_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginDao {
  final SupabaseClient _client;

  LoginDao(this._client);

  Future<UsuarioModel> registrarUsuario(LoginModel model) async {
    final response = await _client.auth.signUp(
      email: model.email,
      password: model.password,
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
      nome: model.nome,
    );
  }

  Future<UsuarioModel> login(LoginModel model) async {
    final data = await _client.from('usuarios').select('id').eq('nome', model.nome).maybeSingle();

    if (data == null) throw const AuthException('Usuário não encontrado');

    final response = await _client.auth.signInWithPassword(
      email: model.email,
      password: model.password,
    );

    if (response.session == null || response.user == null) {
      throw const AuthException('Falha ao fazer login');
    }

    return UsuarioModel(
      id: response.user!.id,
      email: response.user!.email!,
      nome: model.nome,
    );
  }

  Future<void> logout() async {
    await _client.auth.signOut();
  }
}
