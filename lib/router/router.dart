import 'package:auto_route/auto_route.dart';
import 'package:todyapp/router/router.gr.dart';

import 'guards/index.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class RootRouter extends $RootRouter {
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        _authenticationRoute,
        _mainRoute,
      ];
}

final _authenticationRoute = CustomRoute(
  path: '/',
  initial: true,
  page: AuthenticationRouter.page,
  guards: [AuthGuard()],
  children: [
    AutoRoute(
      initial: true,
      path: 'splash',
      page: SplashRoute.page,
    ),
    AutoRoute(
      path: 'onboarding',
      page: OnboardingRoute.page,
    ),
    AutoRoute(
      path: 'login',
      page: LoginRoute.page,
    ),
    AutoRoute(
      path: 'sign-up',
      page: SignUpRoute.page,
    ),
    AutoRoute(
      path: 'forgot-password',
      page: ForgotPasswordRoute.page,
    ),
    AutoRoute(
      path: 'forgot-password-success',
      page: ForgotPasswordSuccessRoute.page,
    ),
    AutoRoute(
      path: 'reset-password',
      page: ResetPassWordRoute.page,
    ),
  ],
);

final _mainRoute = CustomRoute(
  path: '/',
  page: MainRouter.page,
  children: [
    AutoRoute(
      path: 'home',
      initial: true,
      page: HomeRoute.page,
    ),
  ],
);
