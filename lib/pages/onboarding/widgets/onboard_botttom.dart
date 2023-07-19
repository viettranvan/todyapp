import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todyapp/components/index.dart';
import 'package:todyapp/utils/index.dart';

class OnboardBottom extends StatelessWidget {
  const OnboardBottom(
      {super.key,
      required this.controller,
      required this.pageIndex,
      this.onNext,
      this.onSkip,
      this.onGetStarted});

  final PageController controller;
  final int pageIndex;
  final VoidCallback? onNext;
  final VoidCallback? onSkip;
  final VoidCallback? onGetStarted;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: const WormEffect(
                  radius: 8,
                  dotHeight: 8,
                  dotWidth: 8,
                  activeDotColor: AppColors.brandPrimary,
                ),
              ),
            ),
            const SizedBox(height: 24),
            pageIndex == 2
                ? AppButton(
                    title: context.strings.getStarted,
                    onPressed: onGetStarted,
                  )
                : SizedBox(
                    height: 48,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: onSkip,
                          child: Text(context.strings.skip,
                              style: AppTextStyles.sfProRegular16),
                        ),
                        Builder(builder: (context) {
                          return InkWell(
                            onTap: onNext,
                            child: Row(
                              children: [
                                Text(context.strings.next,
                                    style: AppTextStyles.sfProRegular16),
                                const Icon(Icons.arrow_right_alt)
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
