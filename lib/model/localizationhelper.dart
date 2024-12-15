import 'package:flutter/material.dart';

class LocalizationHelper {
  static Map<String, Map<String, String>> translations = {
    "en": {
      "appTitle": "Vibe Gadget",
      "mac": "Mac",
      "iphone": "Iphone",
      "ipad": "Ipad",
      "airpods": "Airpods",
      "appleWatch": "Apple Watch",
      "logout": "Log Out",
      "logoutConfirm": "Are you sure to logout?",
      "cancel": "Cancel",
      "productsTitle": "View all products from Apple",
      "advantagesTitle": "Advantages of Digimap",
      "chat": "Chat",
      "home": "Home",
      "search": "Search",
      "profile": "Profile",
    },
    "id": {
      "appTitle": "Vibe Gadget",
      "mac": "Mac",
      "iphone": "Iphone",
      "ipad": "Ipad",
      "airpods": "Airpods",
      "appleWatch": "Apple Watch",
      "logout": "Keluar",
      "logoutConfirm": "Apakah Anda yakin ingin keluar?",
      "cancel": "Batal",
      "productsTitle": "Lihat semua produk dari Apple",
      "advantagesTitle": "Keunggulan Digimap",
      "chat": "Obrolan",
      "home": "Beranda",
      "search": "Cari",
      "profile": "Profil",
    },
  };

  static String currentLanguage = "en";

  static String translate(String key) {
    return translations[currentLanguage]?[key] ?? key;
  }

  static void setLanguage(String languageCode) {
    currentLanguage = languageCode;
  }

  static Future<void> load(Locale locale) async {
    currentLanguage = locale.languageCode;
  }
}

class LocalizationNotifier extends ChangeNotifier {
  String _languageCode = "en";

  String get languageCode => _languageCode;

  void setLanguage(String languageCode) {
    _languageCode = languageCode;
    notifyListeners();
  }
}
