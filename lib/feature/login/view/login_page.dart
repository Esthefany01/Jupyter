import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jupyter/common/utils/dialog_utils.dart';
import 'package:jupyter/common/utils/upper_case_text_formatter.dart';
import 'package:jupyter/common/values/icons_app.dart';
import 'package:jupyter/common/values/text_style_app.dart';
import 'package:jupyter/common/widgets/custom_button.dart';
import 'package:jupyter/common/widgets/custom_password.dart';
import 'package:jupyter/common/widgets/default_text_field.dart';
import 'package:jupyter/data/database/dao/login_dao.dart';
import 'package:jupyter/data/repositories/login_repository_impl.dart';
import 'package:jupyter/domain/usecase/login/login_use_case.dart';
import 'package:jupyter/feature/home/view/home_page.dart';
import 'package:jupyter/feature/login/view/registrar_usuario_page.dart';
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
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final client = Supabase.instance.client;

    _viewmodel = widget.viewmodel ??
        LoginViewmodel(
          loginUseCase: LoginUseCase(
            LoginRepositoryImpl(
              LoginDao(client),
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.primary,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: size.height * 0.05),
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
                  color: colorScheme.onSurface,
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: DefaultTextField(
                  controller: _viewmodel.emailController,
                  label: Text(
                    "Email",
                    style: TextStyleApp.font16.shade500.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                  type: TextInputType.emailAddress,
                  style: TextStyleApp.font13.shade700.copyWith(
                    color: colorScheme.onSurface,
                  ),
                  validator: (value) => _viewmodel.validator(value),
                  inputFormatters: [UpperCaseTextFormatter()],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ValueListenableBuilder(
                  valueListenable: _viewmodel.isObscurePassword,
                  builder: (context, isObscure, child) {
                    return CustomPassword(
                      controller: _viewmodel.passwordController,
                      label: Text(
                        "Senha",
                        style: TextStyleApp.font16.shade500.copyWith(
                          color: colorScheme.onSurface,
                        ),
                      ),
                      style: TextStyleApp.font13.shade700.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      isObscure: isObscure,
                      onPressedIcon: () => _viewmodel.toggleObscurePassword(),
                      validator: (value) => _viewmodel.validator(value),
                    );
                  },
                ),
              ),
              SizedBox(height: size.height * 0.04),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: CustomButton(
                  title: "Login",
                  alignment: MainAxisAlignment.center,
                  textStyle: TextStyleApp.font18.shade900.copyWith(
                    color: Colors.white,
                  ),
                  background: colorScheme.onSurface.withValues(alpha: 0.5),
                  isBorder: false,
                  borderRadius: MediaQuery.of(context).size.width * 0.070,
                  onPressed: () async => await _login(),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              TextButton(
                style: ButtonStyle(
                  overlayColor: WidgetStateProperty.all(
                    colorScheme.onSurface.withValues(alpha: 0.1),
                  ),
                ),
                child: Text(
                  "Não possui conta? Registre-se",
                  style: TextStyleApp.font16.shade800.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
                onPressed: () => _navigateToPage(const RegistrarUsuarioPage()).then((value) {
                  if (value != null) {
                    _viewmodel.setValueEmail(value.email);
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _login() async {
    try {
      if (_formKey.currentState!.validate()) {
        DialogUtils.showLoading(context);
        final result = await _viewmodel.login();
        if (result != null) {
          if (!mounted) return;
          Navigator.pop(context);
          _navigateToPage(const HomePage());
        } else {
          if (!mounted) return;
          Navigator.pop(context);
          DialogUtils.showError(context: context, message: "Erro ao fazer login");
        }
      }
    } on AuthException catch (e) {
      if (!mounted) return;
      Navigator.pop(context);
      DialogUtils.showError(context: context, message: e.message);
    } catch (e) {
      if (!mounted) return;
      Navigator.pop(context);
      DialogUtils.showError(context: context, message: e.toString());
    }
  }

  Future<T?> _navigateToPage<T>(Widget page) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }
}
