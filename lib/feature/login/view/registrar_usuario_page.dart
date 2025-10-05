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
import 'package:jupyter/domain/usecase/login/registrar_usuario_use_case.dart';
import 'package:jupyter/feature/login/viewmodel/registrar_usuario_viewmodel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegistrarUsuarioPage extends StatefulWidget {
  final RegistrarUsuarioViewModel? viewModel;

  const RegistrarUsuarioPage({super.key}) : viewModel = null;
  const RegistrarUsuarioPage.test({super.key, required this.viewModel});

  @override
  State<RegistrarUsuarioPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegistrarUsuarioPage> {
  late RegistrarUsuarioViewModel _viewModel;
  final _keyForm = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final client = Supabase.instance.client;

    _viewModel = widget.viewModel ??
        RegistrarUsuarioViewModel(
          registrarUsuarioUseCase: RegistrarUsuarioUseCase(
            LoginRepositoryImpl(
              LoginDao(client),
            ),
          ),
        );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.primary,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _keyForm,
                  child: Column(
                    children: [
                      SizedBox(height: size.height * 0.01),
                      Center(
                        child: SvgPicture.asset(
                          IconsApp.carIcon,
                          width: size.width * 0.3,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      Text(
                        "Crie sua conta",
                        style: TextStyleApp.font22.shade600.copyWith(
                          color: colorScheme.onSurface,
                        ),
                      ),
                      SizedBox(height: size.height * 0.04),
                      _buildDefaultTextField(
                        controller: _viewModel.usuarioController,
                        labelText: "Usuário",
                      ),
                      const SizedBox(height: 20),
                      _buildDefaultTextField(
                        controller: _viewModel.emailController,
                        labelText: "Email",
                        type: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: ValueListenableBuilder(
                          valueListenable: _viewModel.isObscurePassword,
                          builder: (context, isObscure, child) {
                            return CustomPassword(
                              controller: _viewModel.passwordController,
                              label: Text(
                                "Senha",
                                style: TextStyleApp.font16.shade500.copyWith(
                                  color: colorScheme.onSurface,
                                ),
                              ),
                              style: TextStyleApp.font14.shade700.copyWith(
                                color: colorScheme.onSurface,
                              ),
                              isObscure: isObscure,
                              onPressedIcon: () => _viewModel.toggleObscurePassword(),
                              validator: (value) => _viewModel.validator(value),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: ValueListenableBuilder(
                          valueListenable: _viewModel.isObscureConfirmPassword,
                          builder: (context, isObscure, child) {
                            return CustomPassword(
                              controller: _viewModel.confirmPasswordController,
                              label: Text(
                                "Confirme a senha",
                                style: TextStyleApp.font16.shade500.copyWith(
                                  color: colorScheme.onSurface,
                                ),
                              ),
                              style: TextStyleApp.font14.shade700.copyWith(
                                color: colorScheme.onSurface,
                              ),
                              isObscure: isObscure,
                              onPressedIcon: () => _viewModel.toggleObscureConfirmPassword(),
                              validator: (value) => _viewModel.validatorPassword(value),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: size.height * 0.05),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: CustomButton(
                          title: "Criar conta",
                          alignment: MainAxisAlignment.center,
                          textStyle: TextStyleApp.font18.shade900.copyWith(
                            color: Colors.white,
                          ),
                          background: colorScheme.onSurface.withValues(alpha: 0.5),
                          isBorder: false,
                          borderRadius: MediaQuery.of(context).size.width * 0.070,
                          onPressed: () async => await _registrarUsuario(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDefaultTextField({
    required TextEditingController controller,
    required String labelText,
    TextInputType? type,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: DefaultTextField(
        controller: controller,
        label: Text(
          labelText,
          style: TextStyleApp.font16.shade500.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        textInputAction: TextInputAction.next,
        type: type,
        inputFormatters: [
          UpperCaseTextFormatter(),
        ],
        validator: (value) => _viewModel.validator(value),
      ),
    );
  }

  Future<void> _registrarUsuario() async {
    try {
      if (_keyForm.currentState!.validate()) {
        DialogUtils.showLoading(context);
        final result = await _viewModel.registrarUsuario();
        if (!mounted) return;
        Navigator.pop(context);
        await DialogUtils.showSuccess(context: context, message: "Usuario registrado com sucesso!");
        if (!mounted) return;
        Navigator.pop(context, result);
      }
    } catch (e) {
      if (!mounted) return;
      Navigator.pop(context);
      DialogUtils.showError(context: context, message: e.toString());
    }
  }
}
