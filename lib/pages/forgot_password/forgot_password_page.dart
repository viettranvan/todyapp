import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:todyapp/components/index.dart';
import 'package:todyapp/pages/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:todyapp/pages/forgot_password/views/index.dart';
import 'package:todyapp/router/router.gr.dart';
import 'package:todyapp/utils/index.dart';

@RoutePage()
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasswordBloc(),
      child: AppBase(
        dismissKeyboard: true,
        child: BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
          listener: _listener,
          child: Scaffold(
            body: BaseBackground(
              parentContext: context,
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
                            const SizedBox(height: 10),
                            const HeaderSection(),
                            const SizedBox(height: 30),
                            Form(
                              key: _formKey,
                              child: BlocBuilder<ForgotPasswordBloc,
                                  ForgotPasswordState>(
                                builder: (context, state) {
                                  return AppTextField(
                                    controller:
                                        BlocProvider.of<ForgotPasswordBloc>(
                                                context)
                                            .emailController,
                                    hintText: context.strings.hintEmail,
                                    textInputAction: TextInputAction.done,
                                    prefixPath: AppAssets.icEmail,
                                    validator: emailValidator,
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text.rich(
                              TextSpan(
                                text: context.strings.rememberPassword,
                                style: AppTextStyles.aBeeZeeRegular16,
                                children: [
                                  TextSpan(
                                    text: context.strings.signIn,
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => Navigator.pop(context),
                                    style:
                                        AppTextStyles.aBeeZeeRegular16.copyWith(
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
                    BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                      builder: (context, state) {
                        return AppButton(
                          width: double.infinity,
                          title: context.strings.submit,
                          onPressed: () => _onSubmit(context),
                        );
                      },
                    ),
                    const SizedBox(height: 48),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _onSubmit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<ForgotPasswordBloc>(context).add(SendRequest());
    }
  }

  void _listener(BuildContext context, state) {
    switch (state.runtimeType) {
      case ForgotPasswordLoading:
        EasyLoading.show();
        break;
      case ForgotPasswordSuccess:
        EasyLoading.dismiss();
        context.router.push(const ForgotPasswordSuccessRoute());
        break;
      case ForgotPasswordFailure:
        EasyLoading.dismiss();
        ErrorDialog.show(
            context: context,
            content: (state as ForgotPasswordFailure).errorMessage);
        break;
    }
  }
}
