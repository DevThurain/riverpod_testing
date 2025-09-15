import 'package:flutter/material.dart';
import 'package:riverpod_testing/features/global/dialogs/loading_dialog.dart';
import 'package:riverpod_testing/features/global/dialogs/error_dialog.dart';

abstract class Dialogs {
  static void showLoadingDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      pageBuilder: (context, _, __) => SizedBox(child: LoadingDialog()),
      transitionBuilder: (context, anim1, anim2, child) {
        return FadeTransition(
          opacity: anim1.drive(CurveTween(curve: Curves.easeOut)),
          child: child,
        );
      },
    );
  }

  static void showErrorDialog({
    required String title,
    required String desc,
    required BuildContext context,
    VoidCallback? onPressedConfirm,
    bool barrierDismissible = true,
  }) {
    showGeneralDialog(
      context: context,
      pageBuilder: (context, _, __) => ErrorDialog(title: title, desc: desc, onPressedConfirm: onPressedConfirm),
      transitionBuilder: (context, anim1, anim2, child) {
        return FadeTransition(
          opacity: anim1.drive(CurveTween(curve: Curves.easeOut)),
          child: child,
        );
      },
    );
  }
}
