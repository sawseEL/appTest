import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['fr', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? frText = '',
    String? arText = '',
  }) =>
      [frText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'qdwgnkng': {
      'fr': 'Button',
      'ar': '',
    },
    '1v19j9cr': {
      'fr': 'Page Title',
      'ar': '',
    },
    '66mclbcy': {
      'fr': 'Home',
      'ar': '',
    },
  },
  // Miscellaneous
  {
    'ufu7tktm': {
      'fr': '',
      'ar': '',
    },
    'coiy41lm': {
      'fr': '',
      'ar': '',
    },
    'igrvgx4c': {
      'fr': '',
      'ar': '',
    },
    'uc365qoz': {
      'fr': '',
      'ar': '',
    },
    'xexg20pw': {
      'fr': '',
      'ar': '',
    },
    'w5gd8m9i': {
      'fr': '',
      'ar': '',
    },
    'h6xjhnat': {
      'fr': '',
      'ar': '',
    },
    'a2emkf0n': {
      'fr': '',
      'ar': '',
    },
    'eofhufg8': {
      'fr': '',
      'ar': '',
    },
    '7nzs7v7t': {
      'fr': '',
      'ar': '',
    },
    'fbk9auy3': {
      'fr': '',
      'ar': '',
    },
    '2sasy1mx': {
      'fr': '',
      'ar': '',
    },
    'nvsvpy4j': {
      'fr': '',
      'ar': '',
    },
    '56hkxxg5': {
      'fr': '',
      'ar': '',
    },
    'fgu7klax': {
      'fr': '',
      'ar': '',
    },
    'xvdbdtym': {
      'fr': '',
      'ar': '',
    },
    '47yg0iwc': {
      'fr': '',
      'ar': '',
    },
    'yvlzmz0q': {
      'fr': '',
      'ar': '',
    },
    'wglqclyg': {
      'fr': '',
      'ar': '',
    },
    'jgjnoz10': {
      'fr': '',
      'ar': '',
    },
    '7j896smp': {
      'fr': '',
      'ar': '',
    },
    'rxk2l7yy': {
      'fr': '',
      'ar': '',
    },
    'tqs7y65y': {
      'fr': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
