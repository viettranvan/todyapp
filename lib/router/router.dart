import 'package:auto_route/auto_route.dart';
import 'package:todyapp/router/router.gr.dart';

import 'guards/index.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class RootRouter extends $RootRouter {
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        _authenticationRoute,
        _appRoute,
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

final _appRoute = CustomRoute(
  path: '/',
  page: AppRoute.page,
  children: [
    _homeTabRoute,
    _chatsTabRoute,
    _artifactTabRoute,
    _settingsTabRoute,
  
  ],
);

final _homeTabRoute = AutoRoute(
  path: '',
  page: HomeTabRoute.page,
  children: [
    AutoRoute(
      path: 'home',
      initial: true,
      page: HomeRoute.page,
    ),
  ],
);
final _chatsTabRoute = AutoRoute(
  path: 'chats',
  page: ChatsTabRoute.page,
  children: [
    AutoRoute(
      path: '',
      page: ChatsRoute.page,
    ),
  ],
);
final _artifactTabRoute = AutoRoute(
  path: 'artifact',
  page: ArtifactRoute.page,
  children: [
    AutoRoute(
      path: '',
      page: ArtifactRoute.page,
    ),
  ],
);
final _settingsTabRoute = AutoRoute(
  path: 'settings',
  page: SettingsTabRoute.page,
  children: [
    AutoRoute(
      path: '',
      page: SettingsRoute.page,
    ),
  ],
);
