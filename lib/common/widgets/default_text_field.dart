import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jupyter/common/values/text_style_app.dart';

class DefaultTextField extends StatelessWidget {
  const DefaultTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.validator,
    this.textInputAction,
    this.suffixIcon,
    this.onTap,
    this.onPressed,
    this.type,
    this.label,
    this.filled = false,
    this.focusedBorder = true,
    this.enabledBorder = true,
    this.textAlign = TextAlign.start,
    this.onChanged,
    this.inputFormatters,
    this.hintStyle,
    this.style,
  });

  final TextEditingController controller;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final String? suffixIcon;
  final VoidCallback? onTap;
  final VoidCallback? onPressed;
  final TextInputType? type;
  final Widget? label;
  final bool filled;
  final bool focusedBorder;
  final bool enabledBorder;
  final TextAlign textAlign;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? hintStyle;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final onSurface = colorScheme.onSurface;

    return TextFormField(
      minLines: 1,
      textAlign: textAlign,
      keyboardType: type,
      onTap: onTap,
      controller: controller,
      validator: validator,
      textInputAction: textInputAction,
      cursorColor: colorScheme.onSurface,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      style: style,
      decoration: InputDecoration(
        errorStyle: TextStyleApp.font12.shade900.copyWith(
          color: colorScheme.error,
        ),
        filled: filled,
        fillColor: colorScheme.primaryContainer,
        label: label,
        hintText: hintText,
        hintStyle: hintStyle ??
            TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: onSurface.withValues(alpha: 0.4),
            ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        suffixIcon: _buildSuffixIcon(context),
        border: _border(onSurface),
        focusedBorder: focusedBorder ? _border(onSurface, radius: 4) : null,
        enabledBorder: enabledBorder ? _border(onSurface) : null,
        errorBorder: _border(colorScheme.error),
      ),
    );
  }

  Widget? _buildSuffixIcon(BuildContext context) {
    if (suffixIcon == null) return null;
    return IconButton(
      padding: const EdgeInsets.all(10),
      splashRadius: 15,
      onPressed: onPressed,
      icon: SvgPicture.asset(
        suffixIcon!,
        colorFilter: ColorFilter.mode(
          Theme.of(context).colorScheme.onPrimaryContainer,
          BlendMode.srcIn,
        ),
      ),
    );
  }

  OutlineInputBorder _border(Color color, {double radius = 5}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(color: color),
    );
  }
}
