import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:todyapp/components/index.dart';
import 'package:todyapp/models/index.dart';
import 'package:todyapp/router/router.gr.dart';
import 'package:todyapp/utils/index.dart';

import 'bloc/settings_bloc.dart';
import 'views/index.dart';

enum _SettingSections { userSetting, appSettings, help }

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsBloc()..add(GetUserProfile()),
      child: BlocListener<SettingsBloc, SettingsState>(
        listener: _listener,
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (_, index) => itemBuilder(_, index),
                      separatorBuilder: separatorBuilder,
                      itemCount: _SettingSections.values.length,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    switch (_SettingSections.values[index]) {
      case _SettingSections.userSetting:
        return BlocBuilder<SettingsBloc, SettingsState>(
          buildWhen: (previous, current) => (current is ProfileSuccess),
          builder: (context, state) {
            UserProfile? user = state is ProfileSuccess ? state.user : null;
            return UserSettingsSection(
              imageUrl: user?.photoUrl ?? '',
              name: user?.displayName ?? '',
              accountCallback: () {},
              changePasswordCallback: () => _changePassword(context),
              changeImageCallback: () => _changeImage(context, user?.photoUrl),
            );
          },
        );
      case _SettingSections.appSettings:
        return AppSettingsSection(
          appereanceCallback: () {},
          notificationCallback: () {},
          privacyCallback: () {},
          appLanguageCallback: () {},
        );
      case _SettingSections.help:
        return HelpSections(
          helpCallback: () {},
          inviteFriendCallback: () {},
          logOutCallback: () =>
              context.read<SettingsBloc>().add(RequestLogOut()),
        );
      default:
    }
    return const FlutterLogo();
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return Container(
      height: 1,
      width: double.infinity,
      color: const Color(0xff3C3C43).withOpacity(0.29),
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 0,
      ),
    );
  }

  void _listener(BuildContext context, SettingsState state) {
    switch (state.runtimeType) {
      case Loading:
        EasyLoading.show();
        break;
      case Failure:
        EasyLoading.dismiss();
        ErrorDialog.show(
            context: context, content: (state as Failure).errorMessage);
        break;
      case ProfileSuccess:
        EasyLoading.dismiss();

        break;
      case UpdateSuccess:
        EasyLoading.dismiss();
        switch ((state as UpdateSuccess).type) {
          case SuccessType.logOut:
            AppDialog.show(
              context: context,
              title: context.strings.notice,
              content: context.strings.logOutNotice,
              onRightButtonTap: () {
                context.router.replaceAll([const AuthenticationRouter()]);
              },
            );
            break;
          case SuccessType.changeImage:
            SuccessDialog.show(
              context: context,
              content: context.strings.avatarChanged,
            );
            break;
          case SuccessType.changePassword:
            SuccessDialog.show(
              context: context,
              content: context.strings.passwordChanged,
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
            );
            break;
        }

        break;
      default:
    }
  }

  _changePassword(BuildContext context) {
    ChangePasswordBottomSheet.show(
        context: context.rootContext,
        onChangePassword: (currentPassword, newPassword) {
          context.read<SettingsBloc>().add(ChangePassword(
              currentPassword: currentPassword, newPassword: newPassword));
        });
  }

  _changeImage(BuildContext context, String? currentAavatar) {
    ChangeImageBottomSheet.show(
        context: context.rootContext,
        updateAvatar: (avatar) {
          // TODO: need change to firestore
          // context.read<SettingsBloc>().add(UpdateAvatar(
          //       currentAavatar: currentAavatar,
          //       newAvatar: avatar.path,
          //     ));
        });
  }
}
