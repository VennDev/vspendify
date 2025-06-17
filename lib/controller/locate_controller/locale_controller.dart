import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:spendify/utils/cache_data.dart';

class LocaleController extends GetxController {
  final currentLocale = const Locale('vi', 'VN').obs; // Mặc định là vi_VN

  Map<String, String> localeMap = {
    'vi': 'vi_VN',
    'en': 'en_US',
  };

  @override
  void onInit() {
    super.onInit();
    loadLocale();
  }

  Future<void> loadLocale() async {
    final langCode = await getCache('languageCode') ?? 'vi';
    final fullLocale = localeMap[langCode] ?? 'vi_VN';
    final newLocale =
        Locale(fullLocale.split('_')[0], fullLocale.split('_')[1]);
    currentLocale.value = newLocale;
    await initializeDateFormatting(fullLocale, null);
    Get.updateLocale(newLocale);
  }

  Future<void> changeLocale(String langCode) async {
    final fullLocale = localeMap[langCode] ?? 'vi_VN';
    final newLocale =
        Locale(fullLocale.split('_')[0], fullLocale.split('_')[1]);

    currentLocale.value = newLocale;
    await saveCache('languageCode', langCode);
    await initializeDateFormatting(fullLocale, null);
    Get.updateLocale(newLocale);
  }
}
