import 'package:flutter/material.dart';
import 'package:todyapp/utils/index.dart';

class BottomsheetView extends StatelessWidget {
  const BottomsheetView(
      {super.key, required this.child, required this.parentContext});

  final Widget child;
  final BuildContext parentContext;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 4,
          width: 64,
          decoration: BoxDecoration(
              color: AppColors.neutralWhite,
              borderRadius: BorderRadius.circular(4)),
        ),
        const SizedBox(height: 6),
        Expanded(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16),
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
            child: child,
          ),
        ),
      ],
    );
  }
}
