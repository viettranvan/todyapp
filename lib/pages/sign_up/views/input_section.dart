// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:todyapp/components/textfield/index.dart';
import 'package:todyapp/utils/index.dart';

class InputSection extends StatelessWidget {
  const InputSection({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  final GlobalKey formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          AppTextField(
            controller: TextEditingController(),
            hintText: context.strings.name,
            textInputAction: TextInputAction.next,
            prefixPath: AppAssets.icUser,
          ),
          const SizedBox(height: 12),
          AppTextField(
            controller: TextEditingController(),
            hintText: context.strings.hintEmail,
            textInputAction: TextInputAction.next,
            prefixPath: AppAssets.icEmail,
            validator: emailValidator,
          ),
          const SizedBox(height: 12),
          AppTextField(
            controller: TextEditingController(),
            hintText: context.strings.hintPassword,
            textInputAction: TextInputAction.next,
            prefixPath: AppAssets.icLock,
            obscureText: true,
            validator: passwordValidator,
          ),
          const SizedBox(height: 12),
          AppTextField(
            controller: TextEditingController(),
            hintText: context.strings.hintConfirmPassword,
            prefixPath: AppAssets.icLock,
            validator: passwordValidator,
            obscureText: true,
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
