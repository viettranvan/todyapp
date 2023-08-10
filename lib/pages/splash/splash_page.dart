import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todyapp/components/index.dart';
import 'package:todyapp/router/router.gr.dart';
import 'package:todyapp/utils/index.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1)).then((value) {
      context.router.replace(const OnboardingRoute());
    });
    return Scaffold(
      backgroundColor: AppColors.brandPrimary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(AppAssets.logoOnboarding),
          const SizedBox(height: 16, width: double.infinity),
          Text(
            context.strings.appName,
            style: AppTextStyles.helveticaBold26.copyWith(
              color: AppColors.neutralWhite,
            ),
          ),
          const SizedBox(height: 16),
          const AppIndicator(),
        ],
      ),
    );
  }
}
