// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todyapp/pages/conversation/widgets/index.dart';
import 'package:todyapp/utils/index.dart';

class InputSection extends StatelessWidget {
  const InputSection({
    Key? key,
    required this.controller,
    required this.onSendMessage,
    required this.onTapEmoji,
    required this.onTap,
    required this.onSubmitted,
    required this.focusNode,
  }) : super(key: key);

  final TextEditingController controller;
  final VoidCallback onSendMessage;
  final VoidCallback onTapEmoji;
  final Function(String)? onSubmitted;

  final VoidCallback onTap;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.greyBackground,
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Center(
              child: SvgPicture.asset(
            AppAssets.icAttach,
            height: 40,
          )),
          const SizedBox(width: 10),
          Expanded(
            child: ChatTextField(
              focusNode: focusNode,
              onTap: onTap,
              onSubmitted: onSubmitted,
              controller: controller,
              onTapEmoji: onTapEmoji,
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: onSendMessage,
            child: Center(
              child: SvgPicture.asset(
                AppAssets.icSendMessage,
                height: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
