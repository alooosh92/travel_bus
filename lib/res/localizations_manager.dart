import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'translation_manager.dart';

class AllLocalizationsManager {
  static Translations translations = TranslationManager();
  static const Locale locale = Locale('ar');
  static const Locale fallbackLocale = Locale('en');
  static const Transition defaultTransition = Transition.fade;
  static const Iterable<Locale> supportedLocales = [Locale('ar'), Locale('en')];
  static const Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates =
      [
    GlobalCupertinoLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];
}
