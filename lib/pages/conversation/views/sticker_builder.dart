import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todyapp/utils/app_utils/index.dart';

import '../bloc/conversation_bloc.dart';

List<String> miniSticker = [
  'assets/emoji/mini/mimi1.gif',
  'assets/emoji/mini/mimi2.gif',
  'assets/emoji/mini/mimi3.gif',
  'assets/emoji/mini/mimi4.gif',
  'assets/emoji/mini/mimi5.gif',
  'assets/emoji/mini/mimi6.gif',
  'assets/emoji/mini/mimi7.gif',
  'assets/emoji/mini/mimi8.gif',
  'assets/emoji/mini/mimi9.gif',
];

double maxKeyboardHeight = 0;

class StickerBuilder extends StatelessWidget {
  const StickerBuilder({
    super.key,
    this.sendSticker,
    required this.showingStatus,
    required this.isClosed,
  });

  final Function(String)? sendSticker;
  final Showing showingStatus;
  final bool isClosed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _getHeight(context),
      decoration: const BoxDecoration(
        border: Border(
            top: BorderSide(color: AppColors.greyBackground, width: 0.5)),
        color: AppColors.neutralWhite,
      ),
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemBuilder: itemBuilder,
        itemCount: miniSticker.length,
      ),
    );
  }

  Widget? itemBuilder(BuildContext context, int index) {
    return Material(
      child: InkWell(
        onTap: () => sendSticker?.call(miniSticker[index]),
        highlightColor: Colors.yellow.withOpacity(0.3),
        splashColor: Colors.red.withOpacity(0.8),
        focusColor: Colors.green.withOpacity(0.0),
        hoverColor: Colors.blue.withOpacity(0.8),
        child: Image.asset(
          miniSticker[index],
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  double _getHeight(BuildContext context) {
    var bottom = MediaQuery.viewInsetsOf(context).bottom;
    maxKeyboardHeight = max(maxKeyboardHeight, bottom);

    switch (showingStatus) {
      case Showing.none:
        return 0;
      case Showing.both:
        return bottom;
      case Showing.sticker:
      case Showing.keyboard:
        return maxKeyboardHeight;
    }
  }
}
