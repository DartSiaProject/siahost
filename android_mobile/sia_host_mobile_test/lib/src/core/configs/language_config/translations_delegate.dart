import 'package:flutter/material.dart';

import 'translator.dart';

class TranslationsDelegate extends LocalizationsDelegate<Translator> {
  const TranslationsDelegate();

  @override
  bool isSupported(Locale locale) => ['fr', 'en'].contains(locale.languageCode);

  @override
  Future<Translator> load(Locale locale) => Translator.load(locale);

  @override
  bool shouldReload(TranslationsDelegate old) => false;
}
