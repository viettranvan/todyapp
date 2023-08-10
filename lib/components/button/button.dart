import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todyapp/utils/index.dart';

enum ButtonStyles {
  elevated(AppColors.brandPrimary, AppColors.neutralWhite),
  outline(Colors.transparent, AppColors.neutralPrimary),
  // disable,
  ;

  const ButtonStyles(this.backgroundColor, this.textColor);

  final Color backgroundColor;
  final Color textColor;
}

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    this.width,
    this.height = 48,
    this.title,
    this.onPressed,
    this.buttonStyle = ButtonStyles.elevated,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? title;
  final VoidCallback? onPressed;
  final ButtonStyles buttonStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: buttonStyle.backgroundColor,
      ),
      child: CupertinoButton(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        onPressed: onPressed,
        child: Text(
          title ?? '',
          style: AppTextStyles.sfProMedium18.copyWith(
            color: buttonStyle.textColor,
          ),
        ),
      ),
    );
  }
}
