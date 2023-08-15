import 'package:flutter/material.dart';
import 'package:todyapp/utils/index.dart';

class Onboading3 extends StatelessWidget {
  const Onboading3({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height * 2 / 5;

    return Column(
      children: [
        const SizedBox(height: 60),
        Image.asset(
          AppAssets.onboarding3,
          height: height,
        ),
        const Spacer(),
        Text(
          context.strings.onboarding3Title,
          style: AppTextStyles.helveticaBold26,
        ),
        const SizedBox(height: 20),
        Text(
          context.strings.onboarding3Content,
          style: AppTextStyles.sfProRegular16,
          textAlign: TextAlign.center,
        ),
        const Spacer(),
      ],
    );
  }
}
