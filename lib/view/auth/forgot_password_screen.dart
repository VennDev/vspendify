import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spendify/config/app_color.dart';
import 'package:spendify/controller/auth_controller/login_controller.dart';
import 'package:spendify/utils/language_manager.dart';
import 'package:spendify/utils/size_helpers.dart';
import 'package:spendify/utils/utils.dart';
import 'package:spendify/widgets/custom_button.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.find<LoginController>(); // Sử dụng LoginController hiện có
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          getLanguage().forgot_password_title,
          style: const TextStyle(
            fontSize: 24,
            fontFamily: 'poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
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
                    getLanguage().forgot_password_subtitle,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w400,
                      color: AppColor.secondarySoft,
                    ),
                  ),
                ),
                verticalSpace(16),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 14, right: 14, top: 4),
                  margin: const EdgeInsets.only(bottom: 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        width: 1, color: AppColor.secondaryExtraSoft),
                  ),
                  child: TextField(
                    style: const TextStyle(fontSize: 14, fontFamily: 'poppins'),
                    maxLines: 1,
                    controller: controller.emailC,
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
                verticalSpace(16),
                Obx(() => CustomButton(
                      text: controller.isLoading.isFalse
                          ? getLanguage().send_reset_link
                          : getLanguage().sending_reset_link,
                      onPressed: () {
                        if (controller.isLoading.isFalse) {
                          controller.sendPasswordReset();
                        }
                      },
                      bgcolor: AppColor.primary,
                      height: displayHeight(context) * 0.08,
                      width: displayWidth(context),
                      textSize: 16,
                      textColor: Colors.white,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
