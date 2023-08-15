import 'package:flutter/material.dart';
import 'package:todyapp/components/dialog/base_dialog.dart';
import 'package:todyapp/utils/index.dart';

class NoInternetDialog {
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
          imagePath: AppAssets.umaLamp,
          buttonTitle: context.strings.openSettings,
          content: context.strings.checkYourInternet,
          title: context.strings.noInternet,
          onPressed: () {
            Navigator.pop(_);
            onPressed?.call();
          },
        ),
      ),
    );
  }
}
