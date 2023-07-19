import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:todyapp/components/index.dart';
import 'package:todyapp/pages/login/widgets/sso_item.dart';
import 'package:todyapp/utils/index.dart';

class LoginActionSection extends StatelessWidget {
  const LoginActionSection({
    super.key,
    this.onTapForgotPassword,
    this.onTapLogin,
    this.onTapFacebook,
    this.onTapGoogle,
    this.onTapSignUp,
  });

  final VoidCallback? onTapForgotPassword;
  final VoidCallback? onTapLogin;
  final VoidCallback? onTapFacebook;
  final VoidCallback? onTapGoogle;
  final VoidCallback? onTapSignUp;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(height: 10),
          GestureDetector(
            onTap: onTapForgotPassword,
            child: Text(
              context.strings.forgotPassword,
              style: AppTextStyles.sfProRegular16,
            ),
          ),
          const SizedBox(height: 10),
          AppButton(
            title: context.strings.login,
            width: double.infinity,
            onPressed: onTapLogin,
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
                  text: context.strings.dontHaveAccount,
                  style: AppTextStyles.sfProRegular16,
                  children: [
                    TextSpan(
                      text: context.strings.signUp,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => onTapSignUp?.call(),
                      style: AppTextStyles.sfProRegular16.copyWith(
                        color: AppColors.brandSecondary,
                      ),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
