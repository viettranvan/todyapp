import 'package:flutter/material.dart';
import 'package:todyapp/components/index.dart';
import 'package:todyapp/utils/index.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    Key? key,
    required this.userName,
    required this.phoneNumber,
    this.avatar,
    this.onTapUserInfo,
  }) : super(key: key);

  final String? avatar;
  final String userName;
  final String phoneNumber;
  final VoidCallback? onTapUserInfo;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapUserInfo,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            ProfileImage(
              imageUrl: avatar ?? '',
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: AppTextStyles.mulishBody01,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    phoneNumber,
                    style: AppTextStyles.mulishMetadata01,
                  ),
                ],
              ),
            ),
            Image.asset(
              AppAssets.nextIcon,
              height: 24,
              width: 24,
            ),
          ],
        ),
      ),
    );
  }
}
