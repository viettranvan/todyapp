import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:todyapp/components/index.dart';
import 'package:todyapp/pages/sign_up/bloc/sign_up_bloc.dart';
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
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: BlocConsumer<SignUpBloc, SignUpState>(
        listener: _listener,
        builder: (context, state) {
          return AppBase(
            enableBackButton: false,
            dismissKeyboard: true,
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              body: BaseBackground(
                parentContext: context,
                revert: true,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  itemBuilder: (_, index) => _itemBuilder(context, index),
                  itemCount: _SignUpSection.values.length,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    var bloc = BlocProvider.of<SignUpBloc>(context);

    switch (_SignUpSection.values[index]) {
      case _SignUpSection.header:
        return const HeaderSection();
      case _SignUpSection.inputField:
        return InputSection(
          formKey: formKey,
          bloc: bloc,
        );
      case _SignUpSection.agreeTerms:
        return TermsSection(
          toggleCheckBox: () => bloc.add(UpdateCheckBox()),
          checkBoxStatus: bloc.state.checkBox,
          onTapTermsOfUse: () {},
          onTapPrivacyPolicy: () {},
        );
      case _SignUpSection.signUpAction:
        return SignUpActionSection(
          checkBoxStatus: bloc.state.checkBox,
          onTapSignUp: () => _onTapSignUp(context),
          onTapFacebook: () {},
          onTapGoogle: () {},
          onTapLogin: () => _onTapLogin(context),
        );
    }
  }

  _onTapLogin(BuildContext context) {
    Navigator.pop(context);
  }

  _onTapSignUp(BuildContext context) {
    if (formKey.currentState!.validate()) {
      BlocProvider.of<SignUpBloc>(context).add(RequestSignUp());
    }
  }

  void _listener(BuildContext context, SignUpState state) {
    switch (state.runtimeType) {
      case SignUpFailure:
        EasyLoading.dismiss();
        ErrorDialog.show(
            context: context, content: (state as SignUpFailure).errorMessage);
        break;
      case SignUpLoading:
        EasyLoading.show();
        break;
      case SignUpSuccess:
        EasyLoading.dismiss();
        SuccessDialog.show(
          context: context,
          content: context.strings.createAccountSuccess,
          onPressed: () {
            Navigator.pop(context);
          },
        );
        break;
      default:
        EasyLoading.dismiss();
        break;
    }
  }
}
