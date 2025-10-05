import 'package:flutter/material.dart';
import 'package:jupyter/common/values/text_style_app.dart';

class CustomPassword extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final VoidCallback? onPressedIcon;
  final String? hintText;
  final bool isObscure;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final Widget? label;

  const CustomPassword({
    super.key,
    required this.controller,
    this.validator,
    this.onChanged,
    this.onPressedIcon,
    this.hintText,
    this.isObscure = false,
    this.hintStyle,
    this.style,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return TextFormField(
      cursorColor: colorScheme.onSurface,
      controller: controller,
      validator: validator,
      obscureText: isObscure,
      onChanged: onChanged,
      style: style,
      decoration: InputDecoration(
        label: label,
        hintText: hintText,
        errorStyle: TextStyleApp.font12.shade900.copyWith(
          color: colorScheme.error,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        hintStyle: hintStyle ??
            TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: colorScheme.onSurface.withValues(alpha: 0.4),
            ),
        suffixIcon: IconButton(
          icon: Icon(isObscure ? Icons.visibility_off : Icons.visibility),
          onPressed: onPressedIcon,
        ),
        border: buildBorder(corBordar: colorScheme.outline),
        disabledBorder: buildBorder(),
        focusedBorder: buildBorder(corBordar: colorScheme.onSurface),
        enabledBorder: buildBorder(corBordar: colorScheme.onPrimary),
        errorBorder: buildBorder(corBordar: colorScheme.error),
      ),
    );
  }

  InputBorder buildBorder({Color? corBordar}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: corBordar != null ? BorderSide(color: corBordar) : BorderSide.none,
    );
  }
}
