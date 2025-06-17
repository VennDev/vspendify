import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spendify/main.dart';
import 'package:spendify/routes/app_pages.dart';
import 'package:spendify/utils/language_manager.dart';
import 'package:spendify/widgets/bottom_navigation.dart';
import 'package:spendify/widgets/toast/custom_toast.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isHidden = true.obs;
  var emailC = TextEditingController();
  var passwordC = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailC.dispose();
    passwordC.dispose();
  }

  Future<bool?> login() async {
    if (emailC.text.isNotEmpty && passwordC.text.isNotEmpty) {
      isLoading.value = true;
      try {
        await supabaseC.auth
            .signInWithPassword(email: emailC.text, password: passwordC.text);

        isLoading.value = false;
        Get.offAll(const BottomNav());

        return true;
      } catch (e) {
        isLoading.value = false;
        emailC.clear();
        passwordC.clear();
        CustomToast.errorToast(getLanguage().title_error, e.toString());
      }
    } else {
      CustomToast.errorToast(
          getLanguage().title_error, getLanguage().email_and_password_required);
    }
    return null;
  }

  Future<void> sendPasswordReset() async {
    try {
      isLoading.value = true;
      await supabaseC.auth.resetPasswordForEmail(
        emailC.text.trim(),
        redirectTo: 'vspendify://auth/callback',
      );
      CustomToast.successToast(
          getLanguage().title_success, getLanguage().sending_reset_link);
      Get.toNamed(Routes.RESET_PASSWORD,
          arguments: {'email': emailC.text.trim()});
    } catch (error) {
      CustomToast.errorToast(getLanguage().title_error, error.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
