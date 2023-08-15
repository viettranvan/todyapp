import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:todyapp/components/index.dart';
import 'package:todyapp/utils/index.dart';

@RoutePage()
class ResetPassWordPage extends StatefulWidget {
  const ResetPassWordPage({super.key});
  @override
  State<ResetPassWordPage> createState() => _ResetPassWordPageState();
}

class _ResetPassWordPageState extends State<ResetPassWordPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height * 2 / 5;

    return AppBase(
      dismissKeyboard: true,
      enableBackButton: false,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: BaseBackground(
          parentContext: context,
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
                                text: 'email',
                                style: AppTextStyles.sfProBold16,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppTextField(
                                controller: TextEditingController(),
                                hintText: context.strings.hinNewPassword,
                                textInputAction: TextInputAction.next,
                                prefixPath: AppAssets.icLock,
                                obscureText: true,
                                validator: passwordValidator,
                              ),
                              const SizedBox(height: 12),
                              AppTextField(
                                controller: TextEditingController(),
                                hintText: context.strings.hintConfirmPassword,
                                prefixPath: AppAssets.icLock,
                                obscureText: true,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 50),
                        AppButton(
                          title: context.strings.submit,
                        ),
                        const SizedBox(height: 12),
                        AppButton(
                          title: context.strings.goBack,
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
    );
  }
}
