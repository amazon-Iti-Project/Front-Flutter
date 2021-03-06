import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  Map<String, String> _localizedValues;
  Map<String, dynamic> _localizedObject;

  Future load() async {
    String jsonStringValues =
        await rootBundle.loadString('lang/${locale.languageCode}.json');

    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);

    _localizedValues = mappedJson.map((key, value) {
      return MapEntry(key, value.toString());
    });
        _localizedObject = mappedJson;
    return true;
  }

  String translate(String key) {
    return _localizedValues[key];
  }

  String translateNested(String parentkey, String nestedKey) {
// Returns a localized text
    Map<String, dynamic> json = _localizedObject[parentkey];
    print("json:$json");
    String value = json[nestedKey] as String;
    print("nestedKey:$nestedKey");
    print("json$value");
    return value;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = new AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
