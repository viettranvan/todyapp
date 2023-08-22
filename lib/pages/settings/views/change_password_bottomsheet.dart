import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:todyapp/components/index.dart';
import 'package:todyapp/router/router.gr.dart';
import 'package:todyapp/utils/index.dart';

class ChangePasswordBottomSheet {
  static Future<bool?> show({
    required BuildContext context,
    required Function(String, String) onChangePassword,
  }) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (ctx) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: BottomsheetWrap(
            title: context.strings.changePassword,
            child: Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.viewInsetsOf(ctx).bottom,
                left: 20,
                right: 20,
              ),
              child: ChangePasswordView(
                onChangePassword: onChangePassword,
              ),
            ),
          ),
        );
      },
    );
  }
}

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key, required this.onChangePassword});
  final Function(String, String) onChangePassword;
  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmNewPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final passNotifier = ValueNotifier<String?>(null);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Column(
          children: [
            const SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextField(
                    controller: oldPasswordController,
                    hintText: context.strings.hintCurrentPassword,
                    textInputAction: TextInputAction.next,
                    prefixPath: AppAssets.icLock,
                    obscureText: true,
                    validator: passwordValidator,
                  ),
                  const SizedBox(height: 12),
                  AppTextField(
                    controller: newPasswordController,
                    onChanged: (value) {
                      passNotifier.value = value;
                    },
                    hintText: context.strings.hinNewPassword,
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
                        isBelow: false,
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  AppTextField(
                      controller: confirmNewPasswordController,
                      hintText: context.strings.hintConfirmPassword,
                      prefixPath: AppAssets.icLock,
                      obscureText: true,
                      validator: (value) => confirmPasswordValidator(
                          value, newPasswordController.text)),
                  const SizedBox(height: 20),
                  AppButton(
                    title: context.strings.submit,
                    onPressed: () => _onSubmit(context),
                  ),
                  const SizedBox(height: 12),
                  AppButton(
                    title: context.strings.cancel,
                    buttonStyle: ButtonStyles.elevatedGrey,
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () => _onForgotPassword(context),
                    child: Center(
                      child: Text(
                        '${context.strings.forgotPassword}?',
                        style: AppTextStyles.aBeeZeeRegular18
                            .copyWith(color: AppColors.textBlue),
                      ),
                    ),
                  ),
                  const SizedBox(height: 48),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  _onSubmit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      widget.onChangePassword
          .call(oldPasswordController.text, confirmNewPasswordController.text);
    }
  }

  _onForgotPassword(BuildContext context) {
    // close bottom sheet
    Navigator.pop(context);
    context.router.push(const ForgotPasswordRoute());
  }
}
