import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:todyapp/components/index.dart';
import 'package:todyapp/pages/forgot_password/views/index.dart';
import 'package:todyapp/router/router.gr.dart';
import 'package:todyapp/utils/index.dart';

@RoutePage()
class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AppBase(
      dismissKeyboard: true,
      child: Scaffold(
        body: BaseBackground(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: MediaQuery.paddingOf(context).top + 10),
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(Icons.arrow_back_ios_new),
                        ),
                        const SizedBox(height: 10),
                        const HeaderSection(),
                        const SizedBox(height: 30),
                        Form(
                          key: _formKey,
                          child: AppTextField(
                            controller: TextEditingController(),
                            hintText: context.strings.hintEmail,
                            textInputAction: TextInputAction.done,
                            prefixPath: AppAssets.icEmail,
                            validator: emailValidator,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text.rich(
                          TextSpan(
                            text: context.strings.rememberPassword,
                            style: AppTextStyles.sfProRegular16,
                            children: [
                              TextSpan(
                                text: context.strings.signIn,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Navigator.pop(context),
                                style: AppTextStyles.sfProRegular16.copyWith(
                                  color: AppColors.brandSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                AppButton(
                  width: double.infinity,
                  title: context.strings.submit,
                  onPressed: () => _onSubmit(context),
                ),
                const SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _onSubmit(BuildContext context) {
    // if (_formKey.currentState!.validate()) {
    //   context.router.push(const ForgotPasswordSuccessRoute());
    // }
    context.router.push(const ForgotPasswordSuccessRoute());
  }
}
