import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todyapp/utils/index.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
    required this.controller,
    required this.onSubmitted,
  }) : super(key: key);

  final TextEditingController controller;
  final Function(String)? onSubmitted;

  get _border => OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          width: 1,
          color: AppColors.neutralLine,
        ),
      );
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        controller: controller,
        style: AppTextStyles.aBeeZeeRegular16,
        textInputAction: TextInputAction.done,
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.greyBackground,
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
