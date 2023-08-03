import 'dart:math' as math;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:todyapp/components/index.dart';
import 'package:todyapp/pages/sign_up/views/index.dart';
import 'package:todyapp/utils/index.dart';

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
        body: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              child: Transform.flip(
                flipY: true,
                child: Transform.rotate(
                    angle: math.pi,
                    child: Image.asset(
                      AppAssets.loginBackground1,
                    )),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Transform.flip(
                flipY: true,
                child: Transform.rotate(
                    angle: math.pi,
                    child: Image.asset(
                      AppAssets.loginBackground2,
                    )),
              ),
            ),
            ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemBuilder: (_, index) => _itemBuilder(context, index),
              itemCount: _SignUpSection.values.length,
            ),
          ],
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
