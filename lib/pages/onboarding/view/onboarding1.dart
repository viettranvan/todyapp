import 'package:flutter/material.dart';
import 'package:todyapp/utils/index.dart';

class Onboading1 extends StatelessWidget {
  const Onboading1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 60),
        Image.asset(
          AppAssets.onboarding1,
          height: 280,
        ),
        const SizedBox(height: 40),
        Text(
          context.strings.onboarding1Title,
          style: AppTextStyles.helveticaBold26,
        ),
        const SizedBox(height: 20),
        Text(
          context.strings.onboarding1Content,
          style: AppTextStyles.sfProRegular16,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}