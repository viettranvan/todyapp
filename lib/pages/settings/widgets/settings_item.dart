import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todyapp/utils/index.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    Key? key,
    required this.iconPath,
    required this.title,
    this.onTap,
  }) : super(key: key);

  final String iconPath;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            SvgPicture.asset(
              iconPath,
              height: 24,
              width: 24,
              colorFilter: const ColorFilter.mode(
                  AppColors.neutralBlack, BlendMode.srcIn),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.mulishBody01,
              ),
            ),
            SvgPicture.asset(
              AppAssets.nextIcon,
              height: 24,
              width: 24,
              colorFilter: const ColorFilter.mode(
                  AppColors.neutralBlack, BlendMode.srcIn),
            ),
          ],
        ),
      ),
    );
  }
}
