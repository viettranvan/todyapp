import 'package:auto_route/auto_route.dart';
import 'package:todyapp/router/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class RootRouter extends $RootRouter {
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        _authenticationRoute,
      ];
}

final _authenticationRoute = CustomRoute(
  path: '/auth',
  initial: true,
  page: AuthenticationRouter.page,
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
  ],
);

// final _mainRoute = CustomRoute(
//   initial: true,
//   path: '',
//   page: AuthenticationRouter.page,
// );
