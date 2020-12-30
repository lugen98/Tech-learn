import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'ar_translations.dart';
import 'en_translation.dart';

class TranslationBaseDelegate extends LocalizationsDelegate<TranslationBase> {
  const TranslationBaseDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<TranslationBase> load(Locale locale) {
    // Returning a SynchronousFuture here because an async 'load' operation
    // isn't needed to produce an instance of DemoLocalizations.
    return SynchronousFuture<TranslationBase>(TranslationBase(locale));
  }

  @override
  bool shouldReload(TranslationBaseDelegate old) => false;
}
class AppLocalizationModel extends Model {
  static var shared = AppLocalizationModel();

  Locale _appLocale = Locale('en');

  Locale get appLocal => _appLocale ?? Locale('en');

  String getCurrentLanguageCode() {
    var currentLang = appLocal.languageCode;

    if (currentLang.contains('ar')) {
      return 'ar';
    }

    return 'en';
  }

  void changeLanguage({String language}) {
    if (language == '') {
      language = 'en';
    }

    _appLocale = Locale(language);

    notifyListeners();
  }

  bool isArabic() {
    var currentLang = appLocal.languageCode;

    return currentLang.contains('ar');
  }
}
class TranslationBase {
  final Locale locale;

  TranslationBase(this.locale);

  static TranslationBase of(BuildContext context) {
    return Localizations.of<TranslationBase>(context, TranslationBase);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': EnTranslations.strings,
    'ar': ArTranslations.strings,
  };

  // INFO : use this instead of implement null checker in each getter
  String _getValue(String key) {
    String trans = _localizedValues[locale.languageCode][key] ?? '';

    if (trans == null) {
      trans = '';
    }

    return trans;
  }

  String get homeTitle {
    return _getValue('homeTitle');
  }
  String get centeredText {
    return _getValue('centeredText');
  }
}

