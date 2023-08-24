import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todyapp/components/dialog/index.dart';
import 'package:todyapp/router/router.dart';
import 'package:todyapp/router/router.gr.dart';

import 'utils/index.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FlutterConfig.loadEnvVariables();
  setupLocator();
  AppLoadings.configs();

  return runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = RootRouter();

  late AppLinks _appLinks;
  StreamSubscription<Uri>? _linkSubscription;

  @override
  void initState() {
    initDeepLinks();
    super.initState();
  }

  @override
  void dispose() {
    _linkSubscription?.cancel();

    super.dispose();
  }

  Future<void> initDeepLinks() async {
    _appLinks = AppLinks();

    // Check initial link if app was in cold state (terminated)
    final appLink = await _appLinks.getInitialAppLink();
    if (appLink != null) {
      openAppLink(appLink);
    }

    // Handle link when app is in warm state (front or background)
    _linkSubscription = _appLinks.uriLinkStream.listen((uri) {
      openAppLink(uri);
    });
  }

  void openAppLink(Uri uri) {
    var oobCode = uri.queryParameters["oobCode"];
    var email = uri.queryParameters["email"];

    if (oobCode != null && email != null) {
      _appRouter.push(ResetPassWordRoute(
        oobCode: oobCode,
        email: email,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Poppins',
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          // replace default CupertinoPageTransitionsBuilder with this
          TargetPlatform.iOS: NoShadowCupertinoPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        }),
        highlightColor: Colors.transparent,

        /// Prevents to splash effect when clicking.
        splashColor: Colors.transparent,

        /// Prevents the mouse cursor to highlight the tile when hovering on web.
        hoverColor: Colors.transparent,

        /// Makes the top and bottom dividers invisible when expanded.
        dividerColor: Colors.transparent,
        appBarTheme: const AppBarTheme(surfaceTintColor: Colors.transparent),

        /// Make background transparent.
        expansionTileTheme: const ExpansionTileThemeData(
          backgroundColor: Colors.transparent,
          collapsedBackgroundColor: Colors.transparent,
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      locale: const Locale('vi'),
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      builder: EasyLoading.init(),
    );
  }
}
