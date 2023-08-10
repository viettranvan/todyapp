import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:todyapp/utils/index.dart';

class BaseBackground extends StatelessWidget {
  const BaseBackground({
    super.key,
    required this.child,
    this.revert = false,
  });

  final Widget child;
  final bool revert;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height * 3 / 5;
    return Stack(
      children: [
        Positioned(
          bottom: 0 - MediaQuery.viewInsetsOf(context).bottom,
          right: revert ? 0 : null,
          left: !revert ? 0 : null,
          child: Transform.flip(
            flipY: revert,
            child: Transform.rotate(
              angle: !revert ? 0 : math.pi,
              child: Image.asset(
                AppAssets.loginBackground1,
                width: 314 / 494 * height,
                height: height,
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: !revert ? 0 : null,
          left: revert ? 0 : null,
          child: Transform.flip(
            flipY: revert,
            child: Transform.rotate(
              angle: !revert ? 0 : math.pi,
              child: Image.asset(
                AppAssets.loginBackground2,
                width: 345 / 452 * height,
                height: height,
              ),
            ),
          ),
        ),
        child
      ],
    );
  }
}
