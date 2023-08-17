import 'package:auto_route/auto_route.dart';
import 'package:todyapp/router/router.gr.dart';
import 'package:todyapp/utils/index.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final storage = locator<AppStorage>();
    final idToken = await storage.getValue(AppStorageKey.idToken);

    if (idToken == null) return resolver.next();
    router.replaceAll([const AppRoute()]);
  }
}
