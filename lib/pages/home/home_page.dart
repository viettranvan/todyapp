import 'dart:developer' as dev;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:todyapp/utils/index.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () async {
            var refreshToken = await locator<AppStorage>()
                .getValue(AppStorageKey.refreshToken);
            dev.log(refreshToken ?? '');
          },
          child: const FlutterLogo(),
        ),
      ),
    );
  }
}
