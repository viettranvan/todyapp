import 'package:flutter/material.dart';
import 'package:todyapp/components/index.dart';
import 'package:todyapp/utils/index.dart';

class AppDialog {
  static void show({
    required BuildContext context,
    String leftTitle = 'Cancel',
    String rightTitle = 'Ok',
    ButtonStyles leftButtonStyle = ButtonStyles.elevated,
    ButtonStyles rightButtonStyle = ButtonStyles.elevated,
    Function? onLeftButtonTap,
    Function? onRightButtonTap,
    required String title,
    required String content,
  }) {
    showGeneralDialog(
      context: context,
      barrierColor: AppColors.neutralBlack.withOpacity(0.4),
      pageBuilder: (dialogContext, __, ___) {
        return Material(
          color: Colors.transparent,
          child: Center(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              margin: const EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                  color: AppColors.neutralWhite,
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      title,
                      style: AppTextStyles.londrinaRegualar24,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    content,
                    style: AppTextStyles.aBeeZeeRegular16,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: AppButton(
                          title: leftTitle,
                          buttonStyle: leftButtonStyle,
                          onPressed: () {
                            Navigator.pop(dialogContext);
                            onLeftButtonTap?.call();
                          },
                        ),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: AppButton(
                          title: rightTitle,
                          onPressed: () {
                            Navigator.pop(dialogContext);
                            onRightButtonTap?.call();
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
