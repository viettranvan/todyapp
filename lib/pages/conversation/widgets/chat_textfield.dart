import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todyapp/utils/index.dart';

class ChatTextField extends StatelessWidget {
  const ChatTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  get _border => OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          width: 1,
          color: AppColors.neutralWhite,
        ),
      );
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        controller: controller,
        style: AppTextStyles.aBeeZeeRegular16,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.neutralWhite,
          hintText: context.strings.search,
          contentPadding: EdgeInsets.zero,
          hintStyle: AppTextStyles.aBeeZeeRegular16
              .copyWith(color: AppColors.neutralGhost),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: SvgPicture.asset(
              AppAssets.icSearch,
              height: 24,
              width: 24,
              colorFilter: const ColorFilter.mode(
                  AppColors.textBlackSecondary, BlendMode.srcIn),
            ),
          ),
          border: _border,
          enabledBorder: _border,
          focusedBorder: _border,
        ),
      ),
    );
  }
}
