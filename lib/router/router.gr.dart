// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;
import 'package:todyapp/main.dart' as _i1;
import 'package:todyapp/pages/forgot_password/forgot_password_page.dart' as _i5;
import 'package:todyapp/pages/forgot_password_success/forgot_password_success_page.dart'
    as _i6;
import 'package:todyapp/pages/home/home_page.dart' as _i2;
import 'package:todyapp/pages/login/login_page.dart' as _i8;
import 'package:todyapp/pages/onboarding/onboarding_page.dart' as _i9;
import 'package:todyapp/pages/reset_password/reset_password_page.dart' as _i4;
import 'package:todyapp/pages/sign_up/sign_up_page.dart' as _i7;
import 'package:todyapp/pages/splash/splash_page.dart' as _i3;
import 'package:todyapp/router/empty_page.dart' as _i10;

abstract class $RootRouter extends _i11.RootStackRouter {
  $RootRouter({super.navigatorKey});

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    MyHomeRoute.name: (routeData) {
      final args = routeData.argsAs<MyHomeRouteArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.MyHomePage(
          key: args.key,
          title: args.title,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SplashPage(),
      );
    },
    ResetPassWordRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ResetPassWordPage(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ForgotPasswordPage(),
      );
    },
    ForgotPasswordSuccessRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ForgotPasswordSuccessPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SignUpPage(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.LoginPage(key: args.key),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.OnboardingPage(),
      );
    },
    AuthenticationRouter.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.AuthenticationEmptyPage(),
      );
    },
    MainRouter.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.MainEmptyPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.MyHomePage]
class MyHomeRoute extends _i11.PageRouteInfo<MyHomeRouteArgs> {
  MyHomeRoute({
    _i12.Key? key,
    required String title,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          MyHomeRoute.name,
          args: MyHomeRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'MyHomeRoute';

  static const _i11.PageInfo<MyHomeRouteArgs> page =
      _i11.PageInfo<MyHomeRouteArgs>(name);
}

class MyHomeRouteArgs {
  const MyHomeRouteArgs({
    this.key,
    required this.title,
  });

  final _i12.Key? key;

  final String title;

  @override
  String toString() {
    return 'MyHomeRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute({List<_i11.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SplashPage]
class SplashRoute extends _i11.PageRouteInfo<void> {
  const SplashRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ResetPassWordPage]
class ResetPassWordRoute extends _i11.PageRouteInfo<void> {
  const ResetPassWordRoute({List<_i11.PageRouteInfo>? children})
      : super(
          ResetPassWordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPassWordRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ForgotPasswordPage]
class ForgotPasswordRoute extends _i11.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i11.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ForgotPasswordSuccessPage]
class ForgotPasswordSuccessRoute extends _i11.PageRouteInfo<void> {
  const ForgotPasswordSuccessRoute({List<_i11.PageRouteInfo>? children})
      : super(
          ForgotPasswordSuccessRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordSuccessRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SignUpPage]
class SignUpRoute extends _i11.PageRouteInfo<void> {
  const SignUpRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i8.LoginPage]
class LoginRoute extends _i11.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i12.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i11.PageInfo<LoginRouteArgs> page =
      _i11.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.OnboardingPage]
class OnboardingRoute extends _i11.PageRouteInfo<void> {
  const OnboardingRoute({List<_i11.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i10.AuthenticationEmptyPage]
class AuthenticationRouter extends _i11.PageRouteInfo<void> {
  const AuthenticationRouter({List<_i11.PageRouteInfo>? children})
      : super(
          AuthenticationRouter.name,
          initialChildren: children,
        );

  static const String name = 'AuthenticationRouter';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i10.MainEmptyPage]
class MainRouter extends _i11.PageRouteInfo<void> {
  const MainRouter({List<_i11.PageRouteInfo>? children})
      : super(
          MainRouter.name,
          initialChildren: children,
        );

  static const String name = 'MainRouter';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}
