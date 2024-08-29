import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocale extends ChangeNotifier {
  Locale? _locale;
  Map<String, String>? _loadedLocalizedValues;


  AppLocale(this._locale);

  Locale get locale => _locale!;

  static AppLocale of(BuildContext context) {
    return Localizations.of<AppLocale>(context, AppLocale)!;
  }

  Future loadLang() async {
    String langFile = await rootBundle
        .loadString('assets/lang/${_locale?.languageCode}.json');
    Map<String, dynamic> loadedValues = jsonDecode(langFile);
    _loadedLocalizedValues =
        loadedValues.map((key, value) => MapEntry(key, value.toString()));
  }

  String getTranslated(String key) {
    if (_loadedLocalizedValues != null &&
        _loadedLocalizedValues!.containsKey(key)) {
      return _loadedLocalizedValues![key]!;
    } else {
      return 'Key not found: $key';
    }
  }

  void changeLanguage(Locale newLocale) async {
    if (_locale != newLocale) {
      _locale = newLocale;
      await loadLang();
      notifyListeners();
    }
  }

  static const LocalizationsDelegate<AppLocale> delegate = _AppLocalDelegate();
}

class _AppLocalDelegate extends LocalizationsDelegate<AppLocale> {
  const _AppLocalDelegate();

  @override
  bool isSupported(Locale locale) {
    return ["en", "ar"].contains(locale.languageCode);
  }

  @override
  Future<AppLocale> load(Locale locale) async {
    AppLocale appLocale = AppLocale(locale);
    await appLocale.loadLang();
    return appLocale;
  }

  @override
  bool shouldReload(_AppLocalDelegate old) => false;
}

String getLang(BuildContext context, String key) {
  return AppLocale.of(context).getTranslated(key);
}
