import 'package:auto_route/auto_route.dart';
import 'package:todyapp/router/router.gr.dart';
import 'package:todyapp/utils/index.dart';

class SplashGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final storage = locator<AppStorage>();
    final idToken = await storage.getValue(AppStorageKey.idToken);

    Future.delayed(const Duration(seconds: 1)).then((value) {
      router.replaceAll(idToken == null
          ? [const AuthenticationRouter()]
          : [const AppRoute()]);
    });
    resolver.next();
  }
}
