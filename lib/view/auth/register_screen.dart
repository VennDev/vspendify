import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spendify/config/app_color.dart';
import 'package:spendify/controller/auth_controller/register_controller.dart';
import 'package:spendify/utils/language_manager.dart';
import 'package:spendify/utils/size_helpers.dart';
import 'package:spendify/utils/utils.dart';
import 'package:spendify/widgets/custom_button.dart';

import '../../routes/app_pages.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      bottomSheet: Material(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColor.secondarySoft,
                    fontSize: 16),
                getLanguage().already_have_account,
              ),
              TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.LOGIN);
                  },
                  child: Text(
                    getLanguage().login_title,
                    style: TextStyle(color: AppColor.primary, fontSize: 16),
                  ))
            ],
          ),
        ),
      ),
      body: SizedBox(
        height: displayHeight(context),
        width: displayWidth(context),
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              padding: const EdgeInsets.only(left: 24, right: 24, top: 36),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    child: Text(
                      getLanguage().register_title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  verticalSpace(16),
                  // name
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(left: 14, right: 14, top: 4),
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          width: 1, color: AppColor.secondaryExtraSoft),
                    ),
                    child: TextField(
                      controller: controller.nameC,
                      style:
                          const TextStyle(fontSize: 14, fontFamily: 'poppins'),
                      maxLines: 1,
                      decoration: InputDecoration(
                        label: Text(
                          "Name",
                          style: TextStyle(
                            color: AppColor.secondarySoft,
                            fontSize: 14,
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: InputBorder.none,
                        hintText: "Pham Van A",
                        hintStyle: TextStyle(
                          fontSize: 14,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w500,
                          color: AppColor.secondarySoft,
                        ),
                      ),
                    ),
                  ),
                  verticalSpace(8),
                  // email
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(left: 14, right: 14, top: 4),
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          width: 1, color: AppColor.secondaryExtraSoft),
                    ),
                    child: TextField(
                      controller: controller.emailC,
                      style:
                          const TextStyle(fontSize: 14, fontFamily: 'poppins'),
                      maxLines: 1,
                      decoration: InputDecoration(
                        label: Text(
                          "Email",
                          style: TextStyle(
                            color: AppColor.secondarySoft,
                            fontSize: 14,
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: InputBorder.none,
                        hintText: "youremail@email.com",
                        hintStyle: TextStyle(
                          fontSize: 14,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w500,
                          color: AppColor.secondarySoft,
                        ),
                      ),
                    ),
                  ),
                  verticalSpace(8),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(left: 14, right: 14, top: 4),
                    margin: const EdgeInsets.only(bottom: 24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          width: 1, color: AppColor.secondaryExtraSoft),
                    ),
                    child: Obx(
                      () => TextField(
                        style: const TextStyle(
                            fontSize: 14, fontFamily: 'poppins'),
                        maxLines: 1,
                        controller: controller.passwordC,
                        obscureText: controller.isHidden.value,
                        decoration: InputDecoration(
                          label: Text(
                            getLanguage().password,
                            style: TextStyle(
                              color: AppColor.secondarySoft,
                              fontSize: 14,
                            ),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: InputBorder.none,
                          hintText: "*************",
                          suffixIcon: IconButton(
                            icon: (controller.isHidden.value != false)
                                ? const Icon(Iconsax.eye)
                                : const Icon(Iconsax.eye_slash4),
                            onPressed: () {
                              controller.isHidden.value =
                                  !(controller.isHidden.value);
                            },
                          ),
                          hintStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w500,
                            color: AppColor.secondarySoft,
                          ),
                        ),
                      ),
                    ),
                  ),
                  verticalSpace(16),
                  Obx(() => CustomButton(
                      text: controller.isLoading.isFalse
                          ? getLanguage().register_title
                          : getLanguage().processing_button,
                      onPressed: () {
                        if (controller.isLoading.isFalse) {
                          // Then proceed with user registration
                          controller.register();
                        }
                      },
                      bgcolor: AppColor.primary,
                      height: displayHeight(context) * 0.08,
                      width: displayWidth(context),
                      textSize: 16,
                      textColor: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
