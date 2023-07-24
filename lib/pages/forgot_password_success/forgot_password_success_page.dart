import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:todyapp/components/index.dart';
import 'package:todyapp/router/router.gr.dart';
import 'package:todyapp/utils/index.dart';

@RoutePage()
class ForgotPasswordSuccessPage extends StatelessWidget {
  const ForgotPasswordSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Image.asset(
              AppAssets.forgotPassword2,
              height: 180,
            ),
            const SizedBox(height: 30),
            Text(
              context.strings.success,
              style: AppTextStyles.helveticaBold32,
            ),
            const SizedBox(height: 6),
            Text(context.strings.checkYourEmail,
                textAlign: TextAlign.center,
                style: AppTextStyles.sfProRegular16),
            const SizedBox(height: 28),
            Text.rich(
              TextSpan(
                text: context.strings.cantGetEmail,
                style: AppTextStyles.sfProRegular16,
                children: [
                  TextSpan(
                    text: context.strings.reSubmit,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Navigator.pop(context),
                    style: AppTextStyles.sfProBold16.copyWith(
                      color: AppColors.neturalGreen,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            AppButton(
              title: context.strings.backToLogin,
              width: double.infinity,
              onPressed: () => context.router.replace(const LoginRoute()),
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}
