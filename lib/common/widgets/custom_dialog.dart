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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      backgroundColor: backgroundColor,
      surfaceTintColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(24),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildIcon(context),
            const SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: textStyle,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                if (hasTwoButtons) const SizedBox(width: 8),
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
    );
  }

  Widget _buildIcon(BuildContext context) {
    return CircleAvatar(
      radius: MediaQuery.of(context).size.height * 0.05,
      backgroundColor: _getColor(context).withValues(alpha: 0.1),
      child: SvgPicture.asset(
        _getIcon(),
        height: 50,
        colorFilter: ColorFilter.mode(_getColor(context), BlendMode.srcIn),
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
