import 'dart:math';

import 'package:derash/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocalProvider extends ChangeNotifier {
  Locale _locale = L10n.all[0];
  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }

  void clearLocal() {
    _locale = L10n.all[0];
    notifyListeners();
  }
}
