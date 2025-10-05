import 'package:flutter/material.dart';
import 'package:jupyter/common/values/text_style_app.dart';
import 'package:jupyter/common/widgets/custom_dialog.dart';
import 'package:jupyter/common/widgets/custom_loading.dart';

class DialogUtils {
  static TextStyle _defaultTextStyle(BuildContext context) {
    return TextStyleApp.font16.shade600.copyWith(
      color: Colors.black,
    );
  }

  static Future<void> _showMessageDialog({
    required BuildContext context,
    required Widget dialogContent,
    bool barrierDismissible = true,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (_) => dialogContent,
    );
  }

  static Future<void> showSuccess({
    required BuildContext context,
    required String message,
  }) {
    return _showMessageDialog(
      context: context,
      dialogContent: CustomDialog(
        title: message,
        textStyle: _defaultTextStyle(context),
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        surfaceColor: Theme.of(context).colorScheme.surface,
        type: DialogType.success,
        onConfirm: () => Navigator.pop(context),
      ),
    );
  }

  static Future<void> showError({
    required BuildContext context,
    required String message,
  }) {
    return _showMessageDialog(
      context: context,
      dialogContent: CustomDialog(
        title: message,
        textStyle: _defaultTextStyle(context),
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        surfaceColor: Theme.of(context).colorScheme.surface,
        type: DialogType.error,
        onConfirm: () => Navigator.pop(context),
      ),
    );
  }

  static Future<void> showWarning({
    required BuildContext context,
    required String message,
    required VoidCallback? onConfirm,
  }) {
    return _showMessageDialog(
      context: context,
      dialogContent: CustomDialog(
        title: message,
        textStyle: _defaultTextStyle(context),
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        surfaceColor: Theme.of(context).colorScheme.surface,
        type: DialogType.warning,
        onConfirm: onConfirm,
      ),
    );
  }

  static Future<void> showLoading(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => PopScope(
        canPop: false,
        child: Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
          surfaceTintColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(20),
          child: const Padding(
            padding: EdgeInsets.all(15),
            child: SizedBox(
              height: 60,
              width: 60,
              child: Center(child: CustomLoading()),
            ),
          ),
        ),
      ),
    );
  }
}
