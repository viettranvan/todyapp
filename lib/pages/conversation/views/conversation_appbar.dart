import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todyapp/components/index.dart';
import 'package:todyapp/models/index.dart';
import 'package:todyapp/utils/index.dart';

class ConversationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ConversationAppBar({super.key, required this.partnerProfile});

  final UserProfile partnerProfile;

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      leadingWidth: 24,
      title: Row(
        children: [
          AvatarImage(
            imageUrl: partnerProfile.photoUrl ?? '',
            name: partnerProfile.displayName ?? '',
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                partnerProfile.displayName ?? '',
                style: AppTextStyles.mulishSubHeading02,
              ),
              const Text('Active now', style: AppTextStyles.aBeeZeeRegular12),
            ],
          ),
        ],
      ),
      actions: [
        SvgPicture.asset(AppAssets.icCall),
        const SizedBox(width: 10),
        SvgPicture.asset(AppAssets.icVideo),
        const SizedBox(width: 10),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
