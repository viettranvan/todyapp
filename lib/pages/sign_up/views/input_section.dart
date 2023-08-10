// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:todyapp/components/textfield/index.dart';
import 'package:todyapp/pages/sign_up/widgets/index.dart';
import 'package:todyapp/utils/index.dart';

class InputSection extends StatelessWidget {
  InputSection({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  final GlobalKey formKey;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final passNotifier = ValueNotifier<String?>(null);
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
            controller: controller,
            onChanged: (value) {
              passNotifier.value = value;
            },
            hintText: context.strings.hintPassword,
            textInputAction: TextInputAction.next,
            prefixPath: AppAssets.icLock,
            obscureText: true,
            validator: passwordValidator,
          ),
          const SizedBox(height: 12),
          ValueListenableBuilder(
            valueListenable: passNotifier,
            builder: (context, value, child) {
              return PasswordChecker(
                password: value ?? '',
              );
            },
          ),
          const SizedBox(height: 12),
          AppTextField(
            controller: TextEditingController(),
            hintText: context.strings.hintConfirmPassword,
            prefixPath: AppAssets.icLock,
            obscureText: true,
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
