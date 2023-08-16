// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:flutter/material.dart' as _i16;
import 'package:todyapp/main.dart' as _i1;
import 'package:todyapp/pages/app_page.dart' as _i10;
import 'package:todyapp/pages/artifact/artifact_page.dart' as _i8;
import 'package:todyapp/pages/chats/chats_page.dart' as _i9;
import 'package:todyapp/pages/forgot_password/forgot_password_page.dart' as _i6;
import 'package:todyapp/pages/forgot_password_success/forgot_password_success_page.dart'
    as _i7;
import 'package:todyapp/pages/home/home_page.dart' as _i3;
import 'package:todyapp/pages/login/login_page.dart' as _i12;
import 'package:todyapp/pages/onboarding/onboarding_page.dart' as _i13;
import 'package:todyapp/pages/reset_password/reset_password_page.dart' as _i5;
import 'package:todyapp/pages/settings/settings_page.dart' as _i2;
import 'package:todyapp/pages/sign_up/sign_up_page.dart' as _i11;
import 'package:todyapp/pages/splash/splash_page.dart' as _i4;
import 'package:todyapp/router/empty_page.dart' as _i14;

abstract class $RootRouter extends _i15.RootStackRouter {
  $RootRouter({super.navigatorKey});

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    MyHomeRoute.name: (routeData) {
      final args = routeData.argsAs<MyHomeRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.MyHomePage(
          key: args.key,
          title: args.title,
        ),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.SettingsPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SplashPage(),
      );
    },
    ResetPassWordRoute.name: (routeData) {
      final args = routeData.argsAs<ResetPassWordRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.ResetPassWordPage(
          key: args.key,
          oobCode: args.oobCode,
          email: args.email,
        ),
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
    ArtifactRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ArtifactPage(),
      );
    },
    ChatsRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.ChatsPage(),
      );
    },
    AppRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.AppPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.SignUpPage(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.LoginPage(key: args.key),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.OnboardingPage(),
      );
    },
    AuthenticationRouter.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.AuthenticationEmptyPage(),
      );
    },
    MainRouter.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.MainEmptyPage(),
      );
    },
    HomeTabRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.HomeTabPage(),
      );
    },
    ChatsTabRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.ChatsTabPage(),
      );
    },
    ArtifactTabRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.ArtifactTabPage(),
      );
    },
    SettingsTabRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.SettingsTabPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.MyHomePage]
class MyHomeRoute extends _i15.PageRouteInfo<MyHomeRouteArgs> {
  MyHomeRoute({
    _i16.Key? key,
    required String title,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          MyHomeRoute.name,
          args: MyHomeRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'MyHomeRoute';

  static const _i15.PageInfo<MyHomeRouteArgs> page =
      _i15.PageInfo<MyHomeRouteArgs>(name);
}

class MyHomeRouteArgs {
  const MyHomeRouteArgs({
    this.key,
    required this.title,
  });

  final _i16.Key? key;

  final String title;

  @override
  String toString() {
    return 'MyHomeRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i2.SettingsPage]
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
/// [_i3.HomePage]
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
/// [_i4.SplashPage]
class SplashRoute extends _i15.PageRouteInfo<void> {
  const SplashRoute({List<_i15.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ResetPassWordPage]
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
/// [_i8.ArtifactPage]
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
/// [_i9.ChatsPage]
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
/// [_i10.AppPage]
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
/// [_i11.SignUpPage]
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
/// [_i12.LoginPage]
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
/// [_i13.OnboardingPage]
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
/// [_i14.AuthenticationEmptyPage]
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
/// [_i14.MainEmptyPage]
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
/// [_i14.HomeTabPage]
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
/// [_i14.ChatsTabPage]
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
/// [_i14.ArtifactTabPage]
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
/// [_i14.SettingsTabPage]
class SettingsTabRoute extends _i15.PageRouteInfo<void> {
  const SettingsTabRoute({List<_i15.PageRouteInfo>? children})
      : super(
          SettingsTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsTabRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}
