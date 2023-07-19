import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:todyapp/components/index.dart';
import 'package:todyapp/pages/login/views/index.dart';
import 'package:todyapp/utils/index.dart';

enum _LoginSection {
  loginHeading,
  loginInput,
  loginAction, //forgot, login, SSO login, signup,
  // loginFinger,
}

final _formKey = GlobalKey<FormState>();

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBase(
      dismissKeyboard: true,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            Positioned(
              bottom: 0 - MediaQuery.viewInsetsOf(context).bottom,
              left: 0,
              child: Image.asset(AppAssets.loginBackground1),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset(AppAssets.loginBackground2),
            ),
            ListView.builder(
              itemBuilder: (_, index) => _itemBuilder(context, index),
              itemCount: _LoginSection.values.length,
            )
          ],
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
              style: AppTextStyles.sfProRegular16,
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
                Text(context.strings.email,
                    style: AppTextStyles.sfProRegular16),
                const SizedBox(height: 6),
                AppTextField(
                  controller: TextEditingController(),
                  hintText: context.strings.hintEmail,
                  textInputAction: TextInputAction.next,
                  validator: emailValidator,
                ),
                const SizedBox(height: 12),
                Text(context.strings.password,
                    style: AppTextStyles.sfProRegular16),
                const SizedBox(height: 6),
                AppTextField(
                  controller: TextEditingController(),
                  hintText: context.strings.hintPassword,
                  validator: passwordValidator,
                  obscureText: true,
                ),
              ],
            ),
          ),
        );
      case _LoginSection.loginAction:
        return LoginActionSection(
          onTapForgotPassword: () {},
          onTapLogin: () => _onTapLogin(context),
          onTapFacebook: () {},
          onTapGoogle: () {},
          onTapSignUp: () {},
        );

      default:
        return const SizedBox();
    }
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email should not be empty';
    } else if (!regexValidEmail.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    } else if (!regexValidPassword.hasMatch(value)) {
      return 'Please enter a valid password';
    }

    return null;
  }

  void _onTapLogin(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // navigate to main page
    }
  }
}
