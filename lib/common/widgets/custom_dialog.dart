import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jupyter/common/values/icons_app.dart';
import 'package:jupyter/common/values/text_style_app.dart';
import 'package:jupyter/common/widgets/custom_button.dart';
import 'package:jupyter/configs/theme/app_theme.dart';

enum DialogType { error, delete, success, information, warning }

class CustomDialog extends StatelessWidget {
  final String title;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final String? confirmText;
  final String? cancelText;
  final DialogType type;
  final TextStyle textStyle;
  final Color backgroundColor;
  final Color surfaceColor;

  const CustomDialog({
    super.key,
    required this.title,
    required this.type,
    required this.textStyle,
    required this.backgroundColor,
    required this.surfaceColor,
    this.onConfirm,
    this.onCancel,
    this.confirmText,
    this.cancelText,
  });

  @override
  Widget build(BuildContext context) {
    final hasTwoButtons = type == DialogType.delete || type == DialogType.warning;

    return Dialog(
      elevation: 3,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      backgroundColor: backgroundColor,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 50, 16, 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: textStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (hasTwoButtons)
                      Expanded(
                        child: CustomButton(
                          styleType: ButtonStyleType.outline,
                          title: cancelText ?? 'Cancelar',
                          onPressed: () {
                            Navigator.pop(context);
                            onCancel?.call();
                          },
                          background: backgroundColor,
                          foreground: _getColor(context),
                        ),
                      ),
                    if (hasTwoButtons) const SizedBox(width: 12),
                    Expanded(
                      child: CustomButton(
                        title: hasTwoButtons ? (confirmText ?? 'Confirmar') : 'Ok',
                        onPressed: hasTwoButtons
                            ? () {
                                Navigator.pop(context);
                                onConfirm?.call();
                              }
                            : () => Navigator.pop(context),
                        background: _getColor(context),
                        foreground: surfaceColor,
                        textStyle: TextStyleApp.font16.shade900.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: -35,
            child: CircleAvatar(
              radius: 35,
              backgroundColor: _getColor(context),
              child: SvgPicture.asset(
                _getIcon(),
                height: 40,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.onSurface,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getColor(BuildContext context) {
    switch (type) {
      case DialogType.error:
      case DialogType.delete:
        return AppTheme.error;
      case DialogType.success:
        return AppTheme.success;
      case DialogType.warning:
        return AppTheme.warning;
      case DialogType.information:
        return AppTheme.information;
    }
  }

  String _getIcon() {
    switch (type) {
      case DialogType.error:
        return IconsApp.alertCircle;
      case DialogType.delete:
        return IconsApp.delete;
      case DialogType.success:
        return IconsApp.success;
      case DialogType.warning:
        return IconsApp.warning;
      case DialogType.information:
        return IconsApp.alertCircle;
    }
  }
}
