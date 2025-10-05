import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jupyter/common/values/text_style_app.dart';

enum ButtonStyleType { fill, outline }

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.styleType = ButtonStyleType.fill,
    this.hasIcon = false,
    this.svg,
    this.background,
    this.foreground,
    this.textStyle,
    this.alignment,
    this.borderRadius,
    this.isBorder = true,
  });

  final String title;
  final VoidCallback? onPressed;
  final ButtonStyleType styleType;
  final bool hasIcon;
  final String? svg;
  final Color? background;
  final Color? foreground;
  final TextStyle? textStyle;
  final MainAxisAlignment? alignment;
  final double? borderRadius;
  final bool isBorder;

  bool get _isOutline => styleType == ButtonStyleType.outline;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 5,
        minimumSize: const Size(double.infinity, kToolbarHeight),
        backgroundColor: _backgroundColor(context),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            borderRadius ?? MediaQuery.of(context).size.width * 0.011,
          ),
          side: isBorder
              ? BorderSide(
                  color: _isOutline ? _foregroundColor(context) : _backgroundColor(context),
                )
              : BorderSide.none,
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: alignment ?? (hasIcon ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center),
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: textStyle ??
                TextStyleApp.font16.shade900.copyWith(
                  color: _foregroundColor(context),
                ),
          ),
          if (hasIcon && svg != null) ...[
            const SizedBox(width: 10),
            SvgPicture.asset(
              svg!,
              colorFilter: ColorFilter.mode(
                _foregroundColor(context),
                BlendMode.srcIn,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Color _foregroundColor(BuildContext context) {
    return _isOutline ? (foreground ?? Theme.of(context).colorScheme.primary) : (foreground ?? Theme.of(context).colorScheme.onPrimary);
  }

  Color _backgroundColor(BuildContext context) {
    return _isOutline ? (background ?? Theme.of(context).colorScheme.surfaceContainer) : (background ?? Theme.of(context).colorScheme.primary);
  }
}
