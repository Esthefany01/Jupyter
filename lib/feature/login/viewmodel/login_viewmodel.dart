import 'package:flutter/material.dart';
import 'package:jupyter/domain/entities/login/login.dart';
import 'package:jupyter/domain/entities/login/usuario.dart';
import 'package:jupyter/domain/usecase/login/login_use_case.dart';

class LoginViewmodel extends ChangeNotifier {
  final LoginUseCase loginUseCase;

  LoginViewmodel({
    required this.loginUseCase,
  });

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final ValueNotifier<bool> _isObscurePassword = ValueNotifier(false);
  ValueNotifier<bool> get isObscurePassword => _isObscurePassword;

  void toggleObscurePassword() {
    _isObscurePassword.value = !_isObscurePassword.value;
  }

  void setValueEmail(String value) {
    emailController.text = value;
    notifyListeners();
  }

  String? validator(String? value) {
    if (value == null || value.isEmpty) return "Campo Obrigatório";
    return null;
  }

  Future<Usuario?> login() async {
    final model = Login(
      email: emailController.text,
      password: passwordController.text,
    );

    try {
      final result = await loginUseCase.call(model);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
