import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jupyter/common/utils/dialog_utils.dart';
import 'package:jupyter/common/values/icons_app.dart';
import 'package:jupyter/common/values/text_style_app.dart';
import 'package:jupyter/common/widgets/custom_button.dart';
import 'package:jupyter/common/widgets/custom_text_form_field.dart';
import 'package:jupyter/data/database/dao/login_dao.dart';
import 'package:jupyter/data/repositories/login_repository_impl.dart';
import 'package:jupyter/domain/usecase/login/registrar_usuario_use_case.dart';
import 'package:jupyter/feature/login/viewmodel/login_viewmodel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends StatefulWidget {
  final LoginViewmodel? viewmodel;

  const LoginPage({super.key}) : viewmodel = null;
  const LoginPage.test({super.key, required this.viewmodel});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginViewmodel _viewmodel;

  @override
  void initState() {
    super.initState();
    final client = Supabase.instance.client;

    _viewmodel = widget.viewmodel ??
        LoginViewmodel(
          registrarUsuarioUseCase: RegistrarUsuarioUseCase(
            LoginRepositoryImpl(
              LoginDao(client),
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.03),
            Center(
              child: SvgPicture.asset(
                IconsApp.carIcon,
                width: size.width * 0.5,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              "Acessar sua conta",
              style: TextStyleApp.font24.shade600.copyWith(
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: DefaultTextField(
                controller: _viewmodel.emailController,
                hintText: "Email",
                primaryColor: Theme.of(context).colorScheme.primary,
                onPrimaryContainerColor: Theme.of(context).colorScheme.onPrimaryContainer,
                primaryContainerColor: Theme.of(context).colorScheme.primaryContainer,
                outlineColor: Theme.of(context).colorScheme.outline,
                filled: false,
                style: TextStyleApp.font13.shade700.copyWith(
                  color: Theme.of(context).colorScheme.surface,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: DefaultTextField(
                controller: _viewmodel.passwordController,
                hintText: "Senha",
                primaryColor: Theme.of(context).colorScheme.primary,
                onPrimaryContainerColor: Theme.of(context).colorScheme.onPrimaryContainer,
                primaryContainerColor: Theme.of(context).colorScheme.primaryContainer,
                outlineColor: Theme.of(context).colorScheme.outline,
                filled: false,
                style: TextStyleApp.font13.shade700.copyWith(
                  color: Theme.of(context).colorScheme.surface,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CustomButton(
                title: "Login",
                alignment: MainAxisAlignment.center,
                textStyle: TextStyleApp.font18.shade900.copyWith(
                  color: Theme.of(context).colorScheme.surface,
                ),
                background: Theme.of(context).colorScheme.surface.withValues(alpha: 0.5),
                onPressed: () async => await _registrarUsuario(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _registrarUsuario() async {
    try {
      final result = await _viewmodel.registrarUsuario();
      if (!mounted) return;
      DialogUtils.showSuccess(context: context, message: "Usuario ${result.email} registrado com sucesso!");
    } catch (e) {
      if (!mounted) return;
      DialogUtils.showError(context: context, message: "Erro ao registrar usuario: $e");
    }
  }
}
