import 'package:flutter/material.dart';
import 'package:todyapp/utils/index.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          AppAssets.forgotPassword1,
          height: 180,
        ),
        const SizedBox(height: 30, width: double.infinity),
        Text(
          context.strings.forgotPassword,
          style: AppTextStyles.helveticaBold26,
        ),
        Text(context.strings.enterEmailRegister,
            textAlign: TextAlign.center, style: AppTextStyles.aBeeZeeRegular16),
      ],
    );
  }
}
