import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todyapp/pages/settings/widgets/index.dart';
import 'package:todyapp/utils/index.dart';

class HelpSections extends StatelessWidget {
  const HelpSections({
    super.key,
    required this.helpCallback,
    required this.inviteFriendCallback,
    required this.logOutCallback,
  });

  final VoidCallback helpCallback;
  final VoidCallback inviteFriendCallback;
  final VoidCallback logOutCallback;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        SettingsItem(
          iconPath: AppAssets.helpIcon,
          title: context.strings.help,
          onTap: helpCallback,
        ),
        const SizedBox(height: 8),
        SettingsItem(
          iconPath: AppAssets.mailIcon,
          title: context.strings.inviteYourFriends,
          onTap: inviteFriendCallback,
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: logOutCallback,
          child: Row(
            children: [
              SvgPicture.asset(AppAssets.icLogOut),
              const SizedBox(width: 10),
              Text(
                context.strings.logOut,
                style: AppTextStyles.aBeeZeeRegular16
                    .copyWith(color: AppColors.errorDefault),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
