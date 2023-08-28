import 'package:flutter/material.dart';
import 'package:todyapp/utils/index.dart';

class ChatTextField extends StatelessWidget {
  const ChatTextField({
    Key? key,
    required this.controller,
    required this.onTapEmoji,
    required this.onTap,
    required this.onSubmitted,
    required this.focusNode,
  }) : super(key: key);

  final TextEditingController controller;
  final VoidCallback onTapEmoji;
  final VoidCallback onTap;
  final Function(String)? onSubmitted;
  final FocusNode focusNode;

  get _border => OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          width: 1,
          color: AppColors.neutralWhite,
        ),
      );
  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlignVertical: TextAlignVertical.center,
      controller: controller,
      focusNode: focusNode,
      onTap: onTap,
      onSubmitted: onSubmitted,
      style: AppTextStyles.aBeeZeeRegular16,
      textInputAction: TextInputAction.done,
      minLines: 1,
      maxLines: 5,
      decoration: InputDecoration(
        filled: true,
        suffixIcon: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: onTapEmoji,
          child: Icon(
            focusNode.hasFocus ? Icons.tag_faces : Icons.keyboard,
            size: 30,
          ),
        ),
        fillColor: AppColors.neutralWhite,
        hintText: context.strings.typeSomething,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        hintStyle: AppTextStyles.aBeeZeeRegular16
            .copyWith(color: AppColors.neutralGhost),
        border: _border,
        enabledBorder: _border,
        focusedBorder: _border,
      ),
    );
  }
}
