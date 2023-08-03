import 'package:flutter/material.dart';

class AppBase extends StatelessWidget {
  const AppBase({
    super.key,
    required this.child,
    this.enableBackButton = true,
    this.dismissKeyboard = false,
  });

  final Widget child;
  final bool enableBackButton;
  final bool dismissKeyboard;

  @override
  Widget build(BuildContext context) {
    return enableBackButton
        ? GestureDetector(
            onTap: dismissKeyboard
                ? () {
                    final FocusScopeNode currentScope = FocusScope.of(context);
                    if (!currentScope.hasPrimaryFocus &&
                        currentScope.hasFocus) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    }
                  }
                : null,
            child: child,
          )
        : WillPopScope(
            onWillPop: () async => enableBackButton,
            child: GestureDetector(
              onTap: dismissKeyboard
                  ? () {
                      final FocusScopeNode currentScope =
                          FocusScope.of(context);
                      if (!currentScope.hasPrimaryFocus &&
                          currentScope.hasFocus) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      }
                    }
                  : null,
              child: child,
            ),
          );
  }
}
