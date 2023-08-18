import 'package:flutter/material.dart';
import 'package:todyapp/components/index.dart';
import 'package:todyapp/pages/settings/widgets/index.dart';
import 'package:todyapp/utils/index.dart';

class UserSettingsSection extends StatelessWidget {
  const UserSettingsSection({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.accountCallback,
    required this.changePasswordCallback,
    required this.changeImageCallback,
  });

  final String imageUrl;
  final String name;
  final VoidCallback accountCallback;
  final VoidCallback changePasswordCallback;
  final VoidCallback changeImageCallback;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        ProfileImage(
          imageUrl: imageUrl,
          size: 108,
        ),
        const SizedBox(height: 6),
        Text(
          name,
          style: AppTextStyles.mulishSubHeading01,
        ),
        const SizedBox(height: 16),
        SettingsItem(
          iconPath: AppAssets.personIcon,
          title: context.strings.account,
          onTap: accountCallback,
        ),
        const SizedBox(height: 8),
        SettingsItem(
          iconPath: AppAssets.icLock,
          title: context.strings.changePassword,
          onTap: changePasswordCallback,
        ),
        const SizedBox(height: 8),
        SettingsItem(
          iconPath: AppAssets.icImage,
          title: context.strings.changeImage,
          onTap: changeImageCallback,
        ),
      ],
    );
  }
}
