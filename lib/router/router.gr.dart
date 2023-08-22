// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:flutter/material.dart' as _i16;
import 'package:todyapp/pages/app_page.dart' as _i1;
import 'package:todyapp/pages/artifact/artifact_page.dart' as _i2;
import 'package:todyapp/pages/chats/chats_page.dart' as _i4;
import 'package:todyapp/pages/conversation/conversation_page.dart' as _i5;
import 'package:todyapp/pages/forgot_password/forgot_password_page.dart' as _i6;
import 'package:todyapp/pages/forgot_password_success/forgot_password_success_page.dart'
    as _i7;
import 'package:todyapp/pages/home/home_page.dart' as _i8;
import 'package:todyapp/pages/login/login_page.dart' as _i9;
import 'package:todyapp/pages/onboarding/onboarding_page.dart' as _i10;
import 'package:todyapp/pages/reset_password/reset_password_page.dart' as _i11;
import 'package:todyapp/pages/settings/settings_page.dart' as _i12;
import 'package:todyapp/pages/sign_up/sign_up_page.dart' as _i13;
import 'package:todyapp/pages/splash/splash_page.dart' as _i14;
import 'package:todyapp/router/empty_page.dart' as _i3;

abstract class $RootRouter extends _i15.RootStackRouter {
  $RootRouter({super.navigatorKey});

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    AppRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AppPage(),
      );
    },
    ArtifactRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ArtifactPage(),
      );
    },
    ArtifactTabRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ArtifactTabPage(),
      );
    },
    AuthenticationRouter.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.AuthenticationEmptyPage(),
      );
    },
    ChatsRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ChatsPage(),
      );
    },
    ChatsTabRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ChatsTabPage(),
      );
    },
    ConversationRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ConversationPage(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ForgotPasswordPage(),
      );
    },
    ForgotPasswordSuccessRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.ForgotPasswordSuccessPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.HomePage(),
      );
    },
    HomeTabRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeTabPage(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.LoginPage(key: args.key),
      );
    },
    MainRouter.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.MainEmptyPage(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.OnboardingPage(),
      );
    },
    ResetPassWordRoute.name: (routeData) {
      final args = routeData.argsAs<ResetPassWordRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.ResetPassWordPage(
          key: args.key,
          oobCode: args.oobCode,
          email: args.email,
        ),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.SettingsPage(),
      );
    },
    SettingsTabRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SettingsTabPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.SignUpPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.SplashPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AppPage]
class AppRoute extends _i15.PageRouteInfo<void> {
  const AppRoute({List<_i15.PageRouteInfo>? children})
      : super(
          AppRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ArtifactPage]
class ArtifactRoute extends _i15.PageRouteInfo<void> {
  const ArtifactRoute({List<_i15.PageRouteInfo>? children})
      : super(
          ArtifactRoute.name,
          initialChildren: children,
        );

  static const String name = 'ArtifactRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ArtifactTabPage]
class ArtifactTabRoute extends _i15.PageRouteInfo<void> {
  const ArtifactTabRoute({List<_i15.PageRouteInfo>? children})
      : super(
          ArtifactTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'ArtifactTabRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i3.AuthenticationEmptyPage]
class AuthenticationRouter extends _i15.PageRouteInfo<void> {
  const AuthenticationRouter({List<_i15.PageRouteInfo>? children})
      : super(
          AuthenticationRouter.name,
          initialChildren: children,
        );

  static const String name = 'AuthenticationRouter';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ChatsPage]
class ChatsRoute extends _i15.PageRouteInfo<void> {
  const ChatsRoute({List<_i15.PageRouteInfo>? children})
      : super(
          ChatsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatsRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ChatsTabPage]
class ChatsTabRoute extends _i15.PageRouteInfo<void> {
  const ChatsTabRoute({List<_i15.PageRouteInfo>? children})
      : super(
          ChatsTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatsTabRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ConversationPage]
class ConversationRoute extends _i15.PageRouteInfo<void> {
  const ConversationRoute({List<_i15.PageRouteInfo>? children})
      : super(
          ConversationRoute.name,
          initialChildren: children,
        );

  static const String name = 'ConversationRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ForgotPasswordPage]
class ForgotPasswordRoute extends _i15.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i15.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ForgotPasswordSuccessPage]
class ForgotPasswordSuccessRoute extends _i15.PageRouteInfo<void> {
  const ForgotPasswordSuccessRoute({List<_i15.PageRouteInfo>? children})
      : super(
          ForgotPasswordSuccessRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordSuccessRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i8.HomePage]
class HomeRoute extends _i15.PageRouteInfo<void> {
  const HomeRoute({List<_i15.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomeTabPage]
class HomeTabRoute extends _i15.PageRouteInfo<void> {
  const HomeTabRoute({List<_i15.PageRouteInfo>? children})
      : super(
          HomeTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeTabRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i9.LoginPage]
class LoginRoute extends _i15.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i16.Key? key,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i15.PageInfo<LoginRouteArgs> page =
      _i15.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.MainEmptyPage]
class MainRouter extends _i15.PageRouteInfo<void> {
  const MainRouter({List<_i15.PageRouteInfo>? children})
      : super(
          MainRouter.name,
          initialChildren: children,
        );

  static const String name = 'MainRouter';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i10.OnboardingPage]
class OnboardingRoute extends _i15.PageRouteInfo<void> {
  const OnboardingRoute({List<_i15.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i11.ResetPassWordPage]
class ResetPassWordRoute extends _i15.PageRouteInfo<ResetPassWordRouteArgs> {
  ResetPassWordRoute({
    _i16.Key? key,
    required String oobCode,
    required String email,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          ResetPassWordRoute.name,
          args: ResetPassWordRouteArgs(
            key: key,
            oobCode: oobCode,
            email: email,
          ),
          initialChildren: children,
        );

  static const String name = 'ResetPassWordRoute';

  static const _i15.PageInfo<ResetPassWordRouteArgs> page =
      _i15.PageInfo<ResetPassWordRouteArgs>(name);
}

class ResetPassWordRouteArgs {
  const ResetPassWordRouteArgs({
    this.key,
    required this.oobCode,
    required this.email,
  });

  final _i16.Key? key;

  final String oobCode;

  final String email;

  @override
  String toString() {
    return 'ResetPassWordRouteArgs{key: $key, oobCode: $oobCode, email: $email}';
  }
}

/// generated route for
/// [_i12.SettingsPage]
class SettingsRoute extends _i15.PageRouteInfo<void> {
  const SettingsRoute({List<_i15.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SettingsTabPage]
class SettingsTabRoute extends _i15.PageRouteInfo<void> {
  const SettingsTabRoute({List<_i15.PageRouteInfo>? children})
      : super(
          SettingsTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsTabRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i13.SignUpPage]
class SignUpRoute extends _i15.PageRouteInfo<void> {
  const SignUpRoute({List<_i15.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i14.SplashPage]
class SplashRoute extends _i15.PageRouteInfo<void> {
  const SplashRoute({List<_i15.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}
