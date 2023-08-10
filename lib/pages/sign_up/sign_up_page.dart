import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:todyapp/components/index.dart';
import 'package:todyapp/pages/sign_up/views/index.dart';

enum _SignUpSection {
  header,
  inputField,
  agreeTerms,
  signUpAction, // sign up, SSO login, back to login
}

@RoutePage()
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  bool checkBox = false;

  @override
  Widget build(BuildContext context) {
    return AppBase(
      enableBackButton: false,
      dismissKeyboard: true,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: BaseBackground(
          revert: true,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            itemBuilder: (_, index) => _itemBuilder(context, index),
            itemCount: _SignUpSection.values.length,
          ),
        ),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    switch (_SignUpSection.values[index]) {
      case _SignUpSection.header:
        return const HeaderSection();
      case _SignUpSection.inputField:
        return InputSection(
          formKey: _formKey,
        );
      case _SignUpSection.agreeTerms:
        return TermsSection(
          toggleCheckBox: () {
            setState(() {
              checkBox = !checkBox;
            });
          },
          checkBoxStatus: checkBox,
          onTapTermsOfUse: () {},
          onTapPrivacyPolicy: () {},
        );
      case _SignUpSection.signUpAction:
        return SignUpActionSection(
          onTapSignUp: () {},
          onTapFacebook: () {},
          onTapGoogle: () {},
          onTapLogin: () => _onTapLogin(context),
        );
    }
  }

  _onTapLogin(BuildContext context) {
    Navigator.pop(context);
  }
}
