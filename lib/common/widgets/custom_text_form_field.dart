import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jupyter/configs/theme/app_theme.dart';

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
    this.readOnly = false,
    this.type,
    this.label,
    this.filled = true,
    this.focusedBorder = true,
    this.enabledBorder = true,
    this.textAlign = TextAlign.start,
    this.onChanged,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.focusNode,
    this.onEditingComplete,
    this.hintStyle,
    this.errorText,
    this.errorMaxLines,
    this.style,
    this.maxLines = 1,
    this.enabled = true,
    required this.primaryColor,
    required this.onPrimaryContainerColor,
    required this.primaryContainerColor,
    required this.outlineColor,
  });

  final TextEditingController controller;
  final String? hintText;
  final String? errorText;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final String? suffixIcon;
  final VoidCallback? onTap;
  final VoidCallback? onPressed;
  final bool readOnly;
  final TextInputType? type;
  final Widget? label;
  final bool filled;
  final bool focusedBorder;
  final bool enabledBorder;
  final TextAlign textAlign;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final VoidCallback? onEditingComplete;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final Color primaryColor;
  final Color primaryContainerColor;
  final Color onPrimaryContainerColor;
  final Color outlineColor;
  final int? errorMaxLines;
  final int maxLines;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final onSurface = Theme.of(context).colorScheme.surface;

    return TextFormField(
      minLines: 1,
      maxLines: maxLines,
      enabled: enabled,
      onEditingComplete: onEditingComplete,
      focusNode: focusNode,
      textAlign: textAlign,
      keyboardType: type,
      onTap: onTap,
      controller: controller,
      validator: validator,
      textInputAction: textInputAction,
      readOnly: readOnly,
      cursorColor: Theme.of(context).colorScheme.onSurface,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      inputFormatters: inputFormatters,
      style: style,
      decoration: InputDecoration(
        errorText: errorText,
        errorMaxLines: errorMaxLines,
        filled: filled,
        fillColor: primaryContainerColor,
        label: label,
        hintText: hintText,
        hintStyle: hintStyle ??
            TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: onSurface.withValues(alpha: 0.4),
            ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        suffixIcon: _buildSuffixIcon(),
        border: _border(onSurface),
        focusedBorder: focusedBorder ? _border(onSurface, radius: 4) : null,
        enabledBorder: enabledBorder ? _border(onSurface) : null,
        errorBorder: _border(AppTheme.error),
      ),
    );
  }

  Widget? _buildSuffixIcon() {
    if (suffixIcon == null) return null;
    return IconButton(
      padding: const EdgeInsets.all(10),
      splashRadius: 15,
      onPressed: onPressed,
      icon: SvgPicture.asset(
        suffixIcon!,
        colorFilter: ColorFilter.mode(
          onPrimaryContainerColor,
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

// class CustomTextFormField extends StatelessWidget {
//   final TextEditingController controller;
//   final String? hintText;
//   final String? Function(String?)? validator;
//   final double? borderRadius;
//   final Color? fillColor;
//   final Color? textColor;
//   final bool isBorder;
//   final bool boxShadow;
//   final List<TextInputFormatter>? inputFormatter;
//   final TextAlign textAlign;

//   const CustomTextFormField({
//     super.key,
//     required this.controller,
//     this.hintText,
//     this.validator,
//     this.borderRadius,
//     this.fillColor,
//     this.textColor,
//     this.isBorder = true,
//     this.boxShadow = false,
//     this.inputFormatter,
//     this.textAlign = TextAlign.start,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final colorScheme = Theme.of(context).colorScheme;

//     return Padding(
//       padding: const EdgeInsets.all(8),
//       child: Container(
//         alignment: Alignment.centerLeft,
//         decoration: BoxDecoration(
//           boxShadow: [
//             boxShadow
//                 ? const BoxShadow(
//                     offset: Offset(0, 10),
//                     blurRadius: 30,
//                     color: Color(0x60000000),
//                   )
//                 : const BoxShadow(color: Colors.transparent)
//           ],
//         ),
//         child: TextFormField(
//           cursorColor: colorScheme.surface,
//           controller: controller,
//           validator: validator,
//           inputFormatters: inputFormatter,
//           textAlign: textAlign,
//           decoration: InputDecoration(
//             isDense: true,
//             hintMaxLines: 1,
//             filled: fillColor != null ? true : false,
//             fillColor: fillColor,
//             hintText: hintText,
//             contentPadding: const EdgeInsets.only(left: 15, right: 10, top: 10, bottom: 10),
//             hintStyle: TextStyle(
//               fontSize: 14,
//               color: textColor ?? colorScheme.onSurface,
//               fontWeight: FontWeight.w200,
//               overflow: TextOverflow.ellipsis,
//             ),
//             border: isBorder ? inputBorder(colorBorder: colorScheme.outline) : inputBorder(),
//             disabledBorder: inputBorder(),
//             focusedBorder: isBorder ? inputBorder(colorBorder: colorScheme.onSurface) : inputBorder(),
//             enabledBorder: isBorder ? inputBorder(colorBorder: colorScheme.onPrimary) : inputBorder(),
//           ),
//         ),
//       ),
//     );
//   }

//   InputBorder inputBorder({Color? colorBorder}) {
//     return OutlineInputBorder(
//       borderRadius: BorderRadius.circular(borderRadius ?? 5),
//       borderSide: colorBorder != null ? BorderSide(color: colorBorder) : BorderSide.none,
//     );
//   }
// }
