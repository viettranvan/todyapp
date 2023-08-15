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
      barrierDismissible: false,
      builder: (_) => _SuccessWidget(
        successCallback: onPressed,
        content: content ?? '',
        buttonTitle: buttonTitle,
      ),
    );
  }
}

class _SuccessWidget extends StatelessWidget {
  const _SuccessWidget({
    this.successCallback,
    this.buttonTitle,
    required this.content,
  });

  final VoidCallback? successCallback;
  final String content;
  final String? buttonTitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            height: 400,
            width: 300,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              image: DecorationImage(
                  image: AssetImage(
                    AppAssets.sunnyDayBackground,
                  ),
                  fit: BoxFit.cover),
            ),
            child: Column(
              children: [
                const SizedBox(height: 20),
                const SizedBox(height: 20),
                Text(
                  context.strings.wellDone,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.londrinaRegualar32.copyWith(
                    color: AppColors.neutralWhite,
                    height: 1,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  content,
                  style: AppTextStyles.sfProRegular16.copyWith(
                    color: AppColors.neutralWhite,
                  ),
                ),
                const Spacer(),
                Image.asset(AppAssets.umaCamping2, height: 150),
                const SizedBox(height: 10),
                AppButton(
                  onPressed: () {
                    Navigator.pop(context);
                    successCallback?.call();
                  },
                  title: buttonTitle ?? context.strings.keepGoing,
                  buttonStyle: ButtonStyles.elevated,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              AppAssets.sun,
              height: 80,
            ),
          ),
          Positioned(
            top: 150,
            left: 0,
            child: Image.asset(
              AppAssets.rainbow,
              height: 80,
            ),
          ),
        ],
      ),
    );
  }
}
