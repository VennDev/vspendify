import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spendify/controller/locate_controller/locale_controller.dart';
import 'package:spendify/main.dart';

class LanguageToggleButton extends StatelessWidget {
  const LanguageToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LocaleController>();

    return Obx(() {
      final isVietnamese = controller.currentLocale.value.languageCode == 'vi';
      final nextLang = isVietnamese ? 'en' : 'vi';
      final buttonText = isVietnamese ? '🇺🇸 English' : '🇻🇳 Tiếng Việt';

      return ElevatedButton(
        onPressed: () {
          controller.changeLocale(nextLang);
          restartApp();
        },
        child: Text(buttonText),
      );
    });
  }
}
