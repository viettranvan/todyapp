import 'package:flutter/material.dart';
import 'package:todyapp/utils/index.dart';

enum ButtonStyles {
  elevated(AppColors.brandPrimary, AppColors.neutralWhite),
  elevatedGrey(AppColors.greyBackground, AppColors.neutralPrimary),
  disable(AppColors.neutral9, AppColors.neutralWhite),
  outline(Colors.transparent, AppColors.neutralPrimary),
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
      child: InkWell(
        onTap: onPressed,
        child: Center(
          child: Text(
            title ?? '',
            style: AppTextStyles.londrinaRegualar24.copyWith(
              color: buttonStyle.textColor,
            ),
          ),
        ),
      ),
    );
  }
}
