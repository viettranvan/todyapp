import 'package:auto_route/auto_route.dart';
import 'package:todyapp/router/router.gr.dart';

import 'guards/index.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class RootRouter extends $RootRouter {
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(
            initial: true,
            path: '/',
            page: SplashRoute.page,
            guards: [SplashGuard()]),
        AutoRoute(
          path: '/onboarding',
          page: OnboardingRoute.page,
        ),
        _authenticationRoute,
        _appRoute,
        _forgotPasswordRoute
      ];
}

final _authenticationRoute = AutoRoute(
  path: '/auth',
  page: AuthenticationRouter.page,
  guards: [AuthGuard()],
  children: [
    AutoRoute(
      initial: true,
      path: 'login',
      page: LoginRoute.page,
    ),
    AutoRoute(
      path: 'sign-up',
      page: SignUpRoute.page,
    )
  ],
);

final _forgotPasswordRoute = AutoRoute(
  path: '/forgot-password',
  page: ForgotPasswordRoute.page,
  children: [
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

final _appRoute = AutoRoute(
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
  meta: const {
    "hidesBottomBarWhenPushed": true,
  },
  children: [
    AutoRoute(
      path: '',
      page: ChatsRoute.page,
    ),
    AutoRoute(
      path: 'conversation',
      page: ConversationRoute.page,
      meta: const {
        "hidesBottomBarWhenPushed": true,
      },
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
