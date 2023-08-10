import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todyapp/utils/index.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.obscureText = false,
    this.validator,
    this.onChanged,
    this.textInputAction,
    this.keyboardType,
    this.prefixPath,
  });

  final TextEditingController controller;
  final String? hintText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final String? prefixPath;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _obscureText;

  @override
  void initState() {
    _obscureText = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      validator: widget.validator,
      textAlignVertical: TextAlignVertical.center,
      onChanged: (value) {
        setState(() {});
        widget.onChanged?.call(value);
      },
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      style: AppTextStyles.sfProRegular16,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.neutralBackground,
        hintText: widget.hintText,
        hintStyle: AppTextStyles.sfProRegular16
            .copyWith(color: AppColors.neutralGhost),
        prefixIcon: widget.prefixPath != null
            ? Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: SvgPicture.asset(widget.prefixPath!),
              )
            : null,
        suffixIcon: Visibility(
          visible: widget.obscureText,
          child: GestureDetector(
            onTap: () => setState(() {
              _obscureText = !_obscureText;
            }),
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: SvgPicture.asset(
                  !_obscureText ? AppAssets.icEye : AppAssets.icEyeClosed),
            ),
          ),
        ),
        border: _border,
        enabledBorder: _border,
        focusedBorder: _border,
      ),
    );
  }

  final _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(
      width: 1,
      color: AppColors.neutralLine,
    ),
  );
}
