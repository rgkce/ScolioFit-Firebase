import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  static final LanguageProvider _instance = LanguageProvider._internal();
  factory LanguageProvider() => _instance;
  LanguageProvider._internal();

  late SharedPreferences _prefs;
  Locale _locale = const Locale('tr'); // Default to Turkish

  Locale get locale => _locale;

  Future<void> init(SharedPreferences prefs) async {
    _prefs = prefs;
    final langCode = _prefs.getString('languageCode');
    if (langCode != null) {
      _locale = Locale(langCode);
    }
    notifyListeners();
  }

  void setLanguage(String langCode) async {
    _locale = Locale(langCode);
    notifyListeners();
    await _prefs.setString('languageCode', langCode);
  }
}
