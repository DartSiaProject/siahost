import 'package:flutter/material.dart';

import 'language_translation_helper.dart';

class TranslationsDelegateHelper
    extends LocalizationsDelegate<LanguageTranslationHelper> {
  const TranslationsDelegateHelper();

  @override
  bool isSupported(Locale locale) => ['fr', 'en'].contains(locale.languageCode);

  @override
  Future<LanguageTranslationHelper> load(Locale locale) =>
      LanguageTranslationHelper.load(locale);

  @override
  bool shouldReload(TranslationsDelegateHelper old) => false;
}
