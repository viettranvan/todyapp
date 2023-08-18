import 'package:flutter/material.dart';
import 'package:todyapp/pages/settings/widgets/index.dart';
import 'package:todyapp/utils/index.dart';

class AppSettingsSection extends StatelessWidget {
  const AppSettingsSection({
    super.key,
    required this.appereanceCallback,
    required this.notificationCallback,
    required this.privacyCallback,
    required this.appLanguageCallback,
  });

  final VoidCallback appereanceCallback;
  final VoidCallback notificationCallback;
  final VoidCallback privacyCallback;
  final VoidCallback appLanguageCallback;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        SettingsItem(
          iconPath: AppAssets.appereanceIcon,
          title: context.strings.appereance,
          onTap: appereanceCallback,
        ),
        const SizedBox(height: 8),
        SettingsItem(
          iconPath: AppAssets.noiificationIcon,
          title: context.strings.notification,
          onTap: notificationCallback,
        ),
        const SizedBox(height: 8),
        SettingsItem(
          iconPath: AppAssets.privacyIcon,
          title: context.strings.privacy,
          onTap: privacyCallback,
        ),
        const SizedBox(height: 8),
        SettingsItem(
          iconPath: AppAssets.appLanguageIcon,
          title: context.strings.appLanguage,
          onTap: appLanguageCallback,
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
