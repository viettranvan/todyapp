import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todyapp/utils/index.dart';

class BottomSheetAppBar extends StatelessWidget {
  final String title;
  const BottomSheetAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Stack(children: [
        Align(
          alignment: Alignment.centerLeft,
          child: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SvgPicture.asset(AppAssets.arrowDownLeftIcon,
                  colorFilter: const ColorFilter.mode(
                      AppColors.greyBackground, BlendMode.srcIn),
                  width: 24,
                  height: 24),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.mulishSubHeading02,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ]),
      const SizedBox(height: 8),
      const Divider(
        thickness: 1,
        height: 4,
        color: AppColors.neutralLine,
      )
    ]);
  }
}
