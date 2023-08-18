// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:todyapp/components/index.dart';
import 'package:todyapp/pages/sign_up/bloc/sign_up_bloc.dart';
import 'package:todyapp/utils/index.dart';

class InputSection extends StatelessWidget {
  const InputSection({
    Key? key,
    required this.formKey,
    required this.bloc,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final SignUpBloc bloc;

  @override
  Widget build(BuildContext context) {
    final passNotifier = ValueNotifier<String?>(bloc.passwordController.text);

    return Form(
      key: formKey,
      child: Column(
        children: [
          AppTextField(
            controller: bloc.nameController,
            hintText: context.strings.name,
            textInputAction: TextInputAction.next,
            prefixPath: AppAssets.icUser,
            validator: emptyValidator,
          ),
          const SizedBox(height: 12),
          AppTextField(
            controller: bloc.emailController,
            hintText: context.strings.hintEmail,
            textInputAction: TextInputAction.next,
            prefixPath: AppAssets.icEmail,
            validator: emailValidator,
          ),
          const SizedBox(height: 12),
          AppTextField(
            controller: bloc.passwordController,
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
              controller: bloc.confirmPasswordController,
              hintText: context.strings.hintConfirmPassword,
              prefixPath: AppAssets.icLock,
              obscureText: true,
              validator: (value) => confirmPasswordValidator(
                  value, bloc.passwordController.text)),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
