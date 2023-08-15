import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:todyapp/components/index.dart';
import 'package:todyapp/pages/reset_password/bloc/reset_password_bloc.dart';
import 'package:todyapp/pages/sign_up/widgets/index.dart';
import 'package:todyapp/utils/index.dart';

@RoutePage()
class ResetPassWordPage extends StatefulWidget {
  const ResetPassWordPage({
    super.key,
    required this.oobCode,
    required this.email,
  });

  final String oobCode;
  final String email;
  @override
  State<ResetPassWordPage> createState() => _ResetPassWordPageState();
}

class _ResetPassWordPageState extends State<ResetPassWordPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height * 2 / 5;

    return BlocProvider(
      create: (context) => ResetPasswordBloc(),
      child: AppBase(
        dismissKeyboard: true,
        enableBackButton: false,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: BaseBackground(
            parentContext: context,
            child: BlocListener<ResetPasswordBloc, ResetPasswordState>(
              listener: _listener,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                height: MediaQuery.paddingOf(context).top + 10),
                            Center(
                              child: Image.asset(
                                AppAssets.umaCamping3,
                                height: height,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              context.strings.resetYourPassword,
                              style: AppTextStyles.helveticaBold26,
                            ),
                            const SizedBox(height: 6),
                            Text.rich(
                              TextSpan(
                                text: "${context.strings.forStr} ",
                                style: AppTextStyles.sfProMedium16,
                                children: [
                                  TextSpan(
                                    text: widget.email,
                                    style: AppTextStyles.sfProBold16,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),
                            BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
                              builder: (context, state) {
                                var bloc =
                                    BlocProvider.of<ResetPasswordBloc>(context);
                                final passNotifier = ValueNotifier<String?>(
                                    bloc.newPasswordsController.text);

                                return Form(
                                  key: _formKey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppTextField(
                                        controller: bloc.newPasswordsController,
                                        onChanged: (value) {
                                          passNotifier.value = value;
                                        },
                                        hintText:
                                            context.strings.hinNewPassword,
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
                                          controller:
                                              bloc.confirmPasswordsController,
                                          hintText: context
                                              .strings.hintConfirmPassword,
                                          prefixPath: AppAssets.icLock,
                                          obscureText: true,
                                          validator: (value) =>
                                              confirmPasswordValidator(
                                                  value,
                                                  bloc.newPasswordsController
                                                      .text)),
                                    ],
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 50),
                            BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
                              builder: (context, state) {
                                return AppButton(
                                  title: context.strings.submit,
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      BlocProvider.of<ResetPasswordBloc>(
                                              context)
                                          .add(SubmibRequest(
                                              oobCode: widget.oobCode));
                                    }
                                  },
                                );
                              },
                            ),
                            const SizedBox(height: 12),
                            AppButton(
                              title: context.strings.goBack,
                              onPressed: () {
                                // TODO: add dialog
                                Navigator.pop(context);
                              },
                            ),
                            const SizedBox(height: 48),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _listener(BuildContext context, ResetPasswordState state) {
    switch (state.runtimeType) {
      case Loading:
        EasyLoading.show();
        break;
      case Success:
        EasyLoading.dismiss();
        SuccessDialog.show(
          context: context,
          content: context.strings.passwordChanged,
          onPressed: () {
            Navigator.pop(context);
          },
        );
        break;

      case Failure:
        EasyLoading.dismiss();

        break;
      default:
    }
  }
}
