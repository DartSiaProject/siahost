import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Translator {
  final Locale locale;
  static Map<dynamic, dynamic> _localizedValues = {};

  Translator(this.locale) {
    _localizedValues = {};
  }

  static Translator? of(BuildContext context) {
    return Localizations.of<Translator>(context, Translator);
  }

  String translate(String key) {
    return _localizedValues[key] ?? '** $key not found';
  }

  static Future<Translator> load(Locale locale) async {
    Translator translations = Translator(locale);
    String jsonContent = await rootBundle
        .loadString("assets/languages/${locale.languageCode}.json");
    _localizedValues = json.decode(jsonContent);
    return translations;
  }

  get currentLanguage => locale.languageCode;
}
