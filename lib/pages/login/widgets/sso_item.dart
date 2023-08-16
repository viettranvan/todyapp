import 'package:flutter/material.dart';
import 'package:todyapp/utils/index.dart';

class SSOItem extends StatelessWidget {
  const SSOItem({
    super.key,
    required this.logo,
    required this.title,
    this.onTap,
  });

  final VoidCallback? onTap;
  final String logo;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: AppColors.socialBackground,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            const Spacer(),
            Image.asset(
              logo,
              height: 24,
              width: 24,
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: AppTextStyles.aBeeZeeRegular16,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
