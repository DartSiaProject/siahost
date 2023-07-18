import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LanguageTranslationHelper {
  final Locale locale;
  static Map<dynamic, dynamic> _localizedValues = {};

  LanguageTranslationHelper(this.locale) {
    _localizedValues = {};
  }

  static LanguageTranslationHelper? of(BuildContext context) {
    return Localizations.of<LanguageTranslationHelper>(
        context, LanguageTranslationHelper);
  }

  String translate(String key) {
    return _localizedValues[key] ?? '** $key not found';
  }

  static Future<LanguageTranslationHelper> load(Locale locale) async {
    LanguageTranslationHelper translations = LanguageTranslationHelper(locale);
    String jsonContent = await rootBundle
        .loadString("assets/languages/${locale.languageCode}.json");
    _localizedValues = json.decode(jsonContent);
    return translations;
  }

  get currentLanguage => locale.languageCode;
}
