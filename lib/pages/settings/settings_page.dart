import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todyapp/components/index.dart';
import 'package:todyapp/utils/index.dart';

import 'widgets/index.dart';

enum _SettingSections { userSetting, appSettings, help }

String _name = 'Ryuk Tran';
String _avatar = '';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView.separated(
                  itemBuilder: (_, index) => itemBuilder(context, index),
                  separatorBuilder: separatorBuilder,
                  itemCount: _SettingSections.values.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    switch (_SettingSections.values[index]) {
      case _SettingSections.userSetting:
        return Column(
          children: [
            const SizedBox(height: 20),
            ProfileImage(
              imageUrl: _avatar,
              size: 108,
            ),
            const SizedBox(height: 6),
            Text(
              _name,
              style: AppTextStyles.mulishSubHeading01,
            ),
            const SizedBox(height: 16),
            SettingsItem(
              iconPath: AppAssets.personIcon,
              title: 'Account',
              onTap: () => _openAccountPage(context),
            ),
            const SizedBox(height: 8),
            SettingsItem(
              iconPath: AppAssets.icLock,
              title: 'Change Password',
              onTap: () => _openChatsSetingsPage(context),
            ),
            const SizedBox(height: 8),
            SettingsItem(
              iconPath: AppAssets.icImage,
              title: 'Change Image',
              onTap: () => _openChatsSetingsPage(context),
            ),
          ],
        );
      case _SettingSections.appSettings:
        return Column(
          children: [
            const SizedBox(height: 8),
            SettingsItem(
              iconPath: AppAssets.appereanceIcon,
              title: 'appereance',
              onTap: () => _openApperancePage(context),
            ),
            const SizedBox(height: 8),
            SettingsItem(
              iconPath: AppAssets.noiificationIcon,
              title: 'notification',
              onTap: () => _openNotificationPage(context),
            ),
            const SizedBox(height: 8),
            SettingsItem(
              iconPath: AppAssets.privacyIcon,
              title: 'privacy',
              onTap: () => _openPrivacyPage(context),
            ),
            const SizedBox(height: 8),
            SettingsItem(
              iconPath: AppAssets.appLanguageIcon,
              title: 'appLanguage',
              onTap: () => _openLanguagePage(context),
            ),
            const SizedBox(height: 8),
          ],
        );
      case _SettingSections.help:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            SettingsItem(
              iconPath: AppAssets.helpIcon,
              title: 'help',
              onTap: () => _openHelpPage(context),
            ),
            const SizedBox(height: 8),
            SettingsItem(
              iconPath: AppAssets.mailIcon,
              title: 'inviteYourFriends',
              onTap: () => _openInviteFriendsPage(context),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  SvgPicture.asset(AppAssets.icLogOut),
                  const SizedBox(width: 10),
                  Text(
                    'Log out',
                    style: AppTextStyles.aBeeZeeRegular16
                        .copyWith(color: AppColors.errorDefault),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        );
      default:
    }
    return const FlutterLogo();
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return Container(
      height: 1,
      width: double.infinity,
      color: const Color(0xff3C3C43).withOpacity(0.29),
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 0,
      ),
    );
  }

  _openLanguagePage(BuildContext context) {}

  void _openApperancePage(BuildContext context) {}

  _openAccountPage(BuildContext context) {}

  _openChatsSetingsPage(BuildContext context) {}

  _openNotificationPage(BuildContext context) {}

  _openPrivacyPage(BuildContext context) {}

  _openHelpPage(BuildContext context) {}

  _openInviteFriendsPage(BuildContext context) {}
}
