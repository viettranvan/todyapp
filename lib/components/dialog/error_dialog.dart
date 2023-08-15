import 'package:flutter/material.dart';
import 'package:todyapp/components/dialog/base_dialog.dart';
import 'package:todyapp/utils/index.dart';

class ErrorDialog {
  static show({
    required BuildContext context,
    required String? content,
    String? buttonTitle,
    VoidCallback? onPressed,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Center(
        child: BaseDialog(
          imagePath: AppAssets.umaDonut,
          buttonTitle: context.strings.ok,
          content: content ?? '',
          title: context.strings.oops,
          onPressed: () {
            Navigator.pop(_);
            onPressed?.call();
          },
        ),
      ),
    );
  }
}
