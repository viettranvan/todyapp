import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_en.dart';

extension LocalizedBuildContext on BuildContext {
  AppLocalizations get strings {
    if (AppLocalizations.of(this) == null) {
      return AppLocalizationsEn();
    } else {
      return AppLocalizations.of(this)!;
    }
  }

  BuildContext get rootContext {
    final rootContext = findRootAncestorStateOfType<NavigatorState>()?.context;
    return rootContext ?? this;
  }
}
