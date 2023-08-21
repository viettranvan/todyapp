import 'package:flutter/material.dart';
import 'package:todyapp/utils/index.dart';

class BottomsheetWrap extends StatelessWidget {
  const BottomsheetWrap({
    super.key,
    required this.child,
    this.title,
  });

  final Widget child;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height -
            (MediaQuery.viewPaddingOf(context).top),
      ),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.transparent,
            offset: Offset(0, 0),
            blurRadius: 12,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Wrap(
        children: [
          Center(
            child: Container(
              height: 4,
              width: 64,
              margin: const EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                  color: AppColors.neutralWhite,
                  borderRadius: BorderRadius.circular(4)),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.neutralWhite,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.transparent,
                  offset: Offset(0, 0),
                  blurRadius: 12,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: title != null
                ? Column(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            title!,
                            style: AppTextStyles.mulishBoldTitle,
                          ),
                        ),
                      ),
                      Container(height: 1, color: AppColors.neutralLine),
                      child,
                    ],
                  )
                : child,
          ),
        ],
      ),
    );
  }
}
