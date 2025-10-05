import 'package:flutter/material.dart';
import 'package:jupyter/domain/entities/login/login.dart';
import 'package:jupyter/domain/entities/login/usuario.dart';
import 'package:jupyter/domain/usecase/login/registrar_usuario_use_case.dart';

class RegistrarUsuarioViewModel extends ChangeNotifier {
  final RegistrarUsuarioUseCase registrarUsuarioUseCase;

  RegistrarUsuarioViewModel({
    required this.registrarUsuarioUseCase,
  });

  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final ValueNotifier<bool> _isObscurePassword = ValueNotifier(true);
  final ValueNotifier<bool> _isObscureConfirmPassword = ValueNotifier(true);
  ValueNotifier<bool> get isObscurePassword => _isObscurePassword;
  ValueNotifier<bool> get isObscureConfirmPassword => _isObscureConfirmPassword;

  void toggleObscurePassword() {
    _isObscurePassword.value = !_isObscurePassword.value;
  }

  void toggleObscureConfirmPassword() {
    _isObscureConfirmPassword.value = !_isObscureConfirmPassword.value;
  }

  String? validator(String? value) {
    if (value == null || value.isEmpty) return "Campo obrigatório";

    return null;
  }

  String? validatorPassword(String? value) {
    if (value == null || value.isEmpty) return "Campo obrigatório";
    if (value != passwordController.text) return "As senhas não coincidem";
    return null;
  }

  Future<Usuario> registrarUsuario() async {
    final model = Login(
      nome: usuarioController.text,
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

  @override
  void dispose() {
    usuarioController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    isObscurePassword.dispose();
    isObscureConfirmPassword.dispose();
    _isObscurePassword.dispose();
    _isObscureConfirmPassword.dispose();
    super.dispose();
  }
}
