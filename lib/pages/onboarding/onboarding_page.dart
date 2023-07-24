import 'dart:math' as math;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:todyapp/pages/onboarding/view/index.dart';
import 'package:todyapp/pages/onboarding/widgets/index.dart';
import 'package:todyapp/router/router.gr.dart';
import 'package:todyapp/utils/index.dart';

@RoutePage()
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  PageController controller = PageController();
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: AppColors.neturalBackground,
        body: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: pageIndex.isOdd ? 0 : null,
              left: pageIndex.isEven ? 0 : null,
              child: Transform.flip(
                flipY: pageIndex.isOdd,
                child: Transform.rotate(
                    angle: pageIndex.isEven ? 0 : math.pi,
                    child: Image.asset(
                      AppAssets.loginBackground1,
                    )),
              ),
            ),
            Positioned(
              top: 0,
              right: pageIndex.isEven ? 0 : null,
              left: pageIndex.isOdd ? 0 : null,
              child: Transform.flip(
                flipY: pageIndex.isOdd,
                child: Transform.rotate(
                    angle: pageIndex.isEven ? 0 : math.pi,
                    child: Image.asset(
                      AppAssets.loginBackground2,
                    )),
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: PageView(
                      controller: controller,
                      onPageChanged: (value) => setState(() {
                        pageIndex = value;
                      }),
                      // physics: const NeverScrollableScrollPhysics(),
                      children: const [
                        Onboading1(),
                        Onboading2(),
                        Onboading3(),
                      ],
                    ),
                  ),
                ),
                OnboardBottom(
                  controller: controller,
                  pageIndex: pageIndex,
                  onNext: () => controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  ),
                  onSkip: () => gotoLoginPage(context),
                  onGetStarted: () => gotoLoginPage(context),
                ),
              ],
            ),
          ],
        ),
        // bottomSheet: OnboardBottom(
        //   controller: controller,
        //   pageIndex: pageIndex,
        //   onNext: () => controller.nextPage(
        //     duration: const Duration(milliseconds: 300),
        //     curve: Curves.easeIn,
        //   ),
        //   onSkip: () => gotoLoginPage(context),
        //   onGetStarted: () => gotoLoginPage(context),
        // ),
      ),
    );
  }

  void gotoLoginPage(BuildContext context) {
    context.router.replace(const LoginRoute());
  }
}