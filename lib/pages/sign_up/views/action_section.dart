// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:todyapp/components/index.dart';
import 'package:todyapp/pages/login/widgets/index.dart';
import 'package:todyapp/utils/index.dart';

class SignUpActionSection extends StatelessWidget {
  const SignUpActionSection({
    Key? key,
    required this.checkBoxStatus,
    required this.onTapSignUp,
    required this.onTapLogin,
    required this.onTapFacebook,
    required this.onTapGoogle,
  }) : super(key: key);

  final bool checkBoxStatus;
  final VoidCallback onTapSignUp;
  final VoidCallback onTapLogin;
  final VoidCallback onTapFacebook;
  final VoidCallback onTapGoogle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        AppButton(
          title: context.strings.signUp,
          width: double.infinity,
          buttonStyle:
              checkBoxStatus ? ButtonStyles.elevated : ButtonStyles.disable,
          onPressed: checkBoxStatus ? onTapSignUp : () {},
        ),
        const SizedBox(height: 10),
        Center(
          child: Text(
            context.strings.or,
            style: AppTextStyles.sfProRegular16,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: SSOItem(
                logo: AppAssets.facebookLogo,
                title: context.strings.facebook,
                onTap: onTapFacebook,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: SSOItem(
                logo: AppAssets.googleLogo,
                title: context.strings.google,
                onTap: onTapGoogle,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Center(
          child: Text.rich(
            TextSpan(
                text: context.strings.alreadyHaveAnAccount,
                style: AppTextStyles.sfProRegular16,
                children: [
                  TextSpan(
                    text: context.strings.login,
                    recognizer: TapGestureRecognizer()..onTap = onTapLogin,
                    style: AppTextStyles.sfProRegular16.copyWith(
                      color: AppColors.brandSecondary,
                    ),
                  ),
                ]),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
