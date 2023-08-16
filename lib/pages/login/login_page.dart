import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:todyapp/components/index.dart';
import 'package:todyapp/pages/login/views/index.dart';
import 'package:todyapp/router/router.gr.dart';
import 'package:todyapp/utils/index.dart';

enum _LoginSection {
  loginHeading,
  loginInput,
  loginAction, //forgot, login, SSO login, signup,
  // loginFinger,
}

@RoutePage()
class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AppBase(
      dismissKeyboard: true,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: BaseBackground(
          parentContext: context,
          child: ListView.builder(
            itemBuilder: (context, index) => _itemBuilder(context, index),
            itemCount: _LoginSection.values.length,
          ),
        ),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    switch (_LoginSection.values[index]) {
      case _LoginSection.loginHeading:
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 68, bottom: 8.0),
              child: Image.asset(AppAssets.login),
            ),
            Text(
              context.strings.login,
              style: AppTextStyles.helveticaBold32,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              context.strings.welcomeBack,
              textAlign: TextAlign.center,
              style: AppTextStyles.aBeeZeeRegular16,
            ),
            const SizedBox(height: 15),
          ],
        );
      case _LoginSection.loginInput:
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                  prefixPath: AppAssets.icLock,
                  validator: passwordValidator,
                  obscureText: true,
                ),
              ],
            ),
          ),
        );
      case _LoginSection.loginAction:
        return LoginActionSection(
          onTapForgotPassword: () => _onTapForgotPassword(context),
          onTapLogin: () => _onTapLogin(context),
          onTapFacebook: () {},
          onTapGoogle: () {},
          onTapSignUp: () => _onTapSignUp(context),
        );

      default:
        return const SizedBox();
    }
  }

  void _onTapLogin(BuildContext context) {
    context.router.push(const AppRoute());

    if (_formKey.currentState!.validate()) {
      // navigate to main page
    }
  }

  void _onTapSignUp(BuildContext context) {
    context.router.push(const SignUpRoute());
  }

  _onTapForgotPassword(BuildContext context) {
    _formKey.currentState!.reset();
    context.router.push(const ForgotPasswordRoute());
  }
}
