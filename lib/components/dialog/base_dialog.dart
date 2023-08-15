import 'package:flutter/material.dart';
import 'package:todyapp/components/index.dart';
import 'package:todyapp/utils/index.dart';

class BaseDialog extends StatelessWidget {
  const BaseDialog({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.content,
    required this.buttonTitle,
    required this.onPressed,
  }) : super(key: key);

  final String imagePath;
  final String title;
  final String content;
  final String buttonTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 300,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        image: DecorationImage(
            image: AssetImage(
              AppAssets.starSkyBackground,
            ),
            fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Image.asset(imagePath, height: 150),
          const SizedBox(height: 20),
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.londrinaRegualar32.copyWith(
              color: AppColors.neutralWhite,
              height: 1,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            content,
            textAlign: TextAlign.center,
            style: AppTextStyles.sfProRegular16.copyWith(
              color: AppColors.neutralWhite,
            ),
          ),
          const Spacer(),
          AppButton(
            onPressed: onPressed,
            title: buttonTitle,
            buttonStyle: ButtonStyles.elevated,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
