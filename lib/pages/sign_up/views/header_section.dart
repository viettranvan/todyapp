import 'package:flutter/material.dart';
import 'package:todyapp/utils/index.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 60),
        Text(
          context.strings.createAccount,
          style: AppTextStyles.sfProMedium26
              .copyWith(color: AppColors.brandPrimary),
        ),
        Text(
          context.strings.registerToGetStarted,
          style:
              AppTextStyles.sfProMedium18.copyWith(color: AppColors.netural9),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
