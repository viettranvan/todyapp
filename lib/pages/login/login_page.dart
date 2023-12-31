import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:todyapp/components/index.dart';
import 'package:todyapp/pages/login/views/index.dart';
import 'package:todyapp/router/router.gr.dart';
import 'package:todyapp/utils/index.dart';

import 'bloc/login_bloc.dart';

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
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocListener<LoginBloc, LoginState>(
        listener: _listener,
        child: AppBase(
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
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              var bloc = context.read<LoginBloc>();

              return Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                      hintText: context.strings.hintPassword,
                      prefixPath: AppAssets.icLock,
                      validator: passwordValidator,
                      obscureText: true,
                    ),
                  ],
                ),
              );
            },
          ),
        );
      case _LoginSection.loginAction:
        return BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return LoginActionSection(
              onTapForgotPassword: () => _onTapForgotPassword(context),
              onTapLogin: () => _onTapLogin(context),
              onTapFacebook: () {},
              onTapGoogle: () => _onTapGoogle(context),
              onTapSignUp: () => _onTapSignUp(context),
            );
          },
        );

      default:
        return const SizedBox();
    }
  }

  void _onTapLogin(BuildContext context) {
    var bloc = context.read<LoginBloc>();

    if (_formKey.currentState!.validate()) {
      // navigate to main page
      bloc.add(SendLoginRequest());
    }
  }

  void _onTapSignUp(BuildContext context) {
    context.router.push(const SignUpRoute());
  }

  _onTapForgotPassword(BuildContext context) {
    _formKey.currentState!.reset();
    context.router.push(const ForgotPasswordRoute());
  }

  void _listener(BuildContext context, LoginState state) {
    switch (state.runtimeType) {
      case Loading:
        EasyLoading.show();
        break;
      case Failure:
        EasyLoading.dismiss();
        ErrorDialog.show(
          context: context,
          content: (state as Failure).errorMessage,
        );
        break;
      case Success:
        EasyLoading.dismiss();
        context.router.replaceAll([const AppRoute()]);
        break;
      default:
        EasyLoading.dismiss();
        break;
    }
  }

  _onTapGoogle(BuildContext context) {
    context.read<LoginBloc>().add(GoogleLoginRequest());
  }
}
