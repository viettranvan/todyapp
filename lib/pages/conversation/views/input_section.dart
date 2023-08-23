// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todyapp/utils/index.dart';

import '../widgets/index.dart';

class InputSection extends StatelessWidget {
  const InputSection({
    Key? key,
    required this.controller,
    required this.onSendMessage,
  }) : super(key: key);

  final TextEditingController controller;
  final VoidCallback onSendMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: AppColors.greyBackground,
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: SvgPicture.asset(AppAssets.archiveIcon)),
          const SizedBox(width: 6),
          Expanded(
            child: ChatTextField(
              controller: controller,
            ),
          ),
          const SizedBox(width: 6),
          GestureDetector(
            onTap: onSendMessage,
            child: Center(
              child: SvgPicture.asset(AppAssets.icSendMessage),
            ),
          ),
        ],
      ),
    );
  }
}
