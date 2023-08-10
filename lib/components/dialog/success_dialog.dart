import 'package:flutter/material.dart';
import 'package:todyapp/components/index.dart';
import 'package:todyapp/utils/index.dart';

class SuccessDialog {
  static show({
    required BuildContext context,
    required String? content,
    String? buttonTitle,
    VoidCallback? onPressed,
  }) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.neutralWhite,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppAssets.forgotPassword2),
            Text(
              content ?? '',
              style: AppTextStyles.sfProMedium16,
            )
          ],
        ),
        actions: [
          AppButton(
            title: buttonTitle ?? context.strings.ok,
            onPressed: () {
              Navigator.pop(_);
              onPressed?.call();
            },
          )
        ],
      ),
    );
  }
}
