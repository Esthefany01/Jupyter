import 'package:flutter/material.dart';
import 'package:jupyter/domain/entities/login/login.dart';
import 'package:jupyter/domain/entities/login/usuario.dart';
import 'package:jupyter/domain/usecase/login/registrar_usuario_use_case.dart';

class LoginViewmodel extends ChangeNotifier {
  final RegistrarUsuarioUseCase registrarUsuarioUseCase;

  LoginViewmodel({
    required this.registrarUsuarioUseCase,
  });

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<Usuario> registrarUsuario() async {
    final model = Login(
      email: emailController.text,
      password: passwordController.text,
    );

    try {
      final result = await registrarUsuarioUseCase.call(model);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
