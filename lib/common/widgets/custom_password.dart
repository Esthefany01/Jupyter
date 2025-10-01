import 'package:flutter/material.dart';

class CustomPassword extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final VoidCallback? onPressedIcon;
  final String? hintText;
  final bool isObscure;

  const CustomPassword({
    super.key,
    required this.controller,
    this.validator,
    this.onChanged,
    this.onPressedIcon,
    this.hintText,
    this.isObscure = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        cursorColor: colorScheme.onSurface,
        controller: controller,
        validator: validator,
        obscureText: isObscure,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          hintStyle: TextStyle(
            fontSize: 14,
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w200,
            overflow: TextOverflow.ellipsis,
          ),
          suffixIcon: IconButton(
            icon: Icon(isObscure ? Icons.visibility_off : Icons.visibility),
            onPressed: onPressedIcon,
          ),
          border: buildBorder(corBordar: colorScheme.outline),
          disabledBorder: buildBorder(),
          focusedBorder: buildBorder(corBordar: colorScheme.surface),
          enabledBorder: buildBorder(corBordar: colorScheme.onPrimary),
        ),
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
