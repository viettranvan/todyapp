// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todyapp/utils/index.dart';

class TermsSection extends StatelessWidget {
  const TermsSection({
    Key? key,
    required this.toggleCheckBox,
    required this.onTapTermsOfUse,
    required this.onTapPrivacyPolicy,
    this.checkBoxStatus = false,
  }) : super(key: key);
  final VoidCallback toggleCheckBox;
  final VoidCallback onTapTermsOfUse;
  final VoidCallback onTapPrivacyPolicy;
  final bool checkBoxStatus;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: toggleCheckBox,
          child: checkBoxStatus
              ? SizedBox(
                  height: 24,
                  width: 24,
                  child: SvgPicture.asset(
                    AppAssets.icCheckBox,
                    colorFilter: const ColorFilter.mode(
                        AppColors.brandPrimary, BlendMode.srcIn),
                  ),
                )
              : Container(
                  height: 18,
                  width: 18,
                  margin: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(
                      width: 1,
                      color: AppColors.neutralSecondary,
                    ),
                  ),
                ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text.rich(
            TextSpan(
              text: context.strings.byRegistering,
              style: AppTextStyles.sfProRegular16.copyWith(
                color: AppColors.neutral9,
              ),
              children: [
                TextSpan(
                  text: context.strings.termsOfUse,
                  recognizer: TapGestureRecognizer()..onTap = onTapTermsOfUse,
                  style: AppTextStyles.sfProRegular16.copyWith(
                    color: AppColors.brandPrimary,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.brandPrimary,
                  ),
                ),
                TextSpan(
                  text: ' ${context.strings.and} ',
                  style: AppTextStyles.sfProRegular16.copyWith(
                    color: AppColors.neutral9,
                  ),
                ),
                TextSpan(
                  text: context.strings.privacyPolicy,
                  recognizer: TapGestureRecognizer()
                    ..onTap = onTapPrivacyPolicy,
                  style: AppTextStyles.sfProRegular16.copyWith(
                    color: AppColors.brandPrimary,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.brandPrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
