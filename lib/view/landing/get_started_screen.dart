import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spendify/config/app_color.dart';
import 'package:spendify/utils/language_manager.dart';
import 'package:spendify/utils/size_helpers.dart';
import 'package:spendify/utils/utils.dart';
import 'package:spendify/widgets/custom_button.dart';

import '../../routes/app_pages.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primarySoft,
      body: Container(
        decoration: BoxDecoration(gradient: AppColor.primaryGradient),
        child: Column(
          children: [
            Expanded(child: Image.asset("assets/wallet.gif")),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Text(
                    getLanguage().control_spending_today,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  verticalSpace(8),
                  Text(
                    getLanguage().discover_smarter_tracking,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: CustomButton(
                isCenter: false,
                text: getLanguage().get_started,
                onPressed: () {
                  Get.offAllNamed(Routes.REGISTER);
                },
                bgcolor: AppColor.secondary,
                height: displayHeight(context) * 0.08,
                width: displayWidth(context),
                textSize: 16,
                textColor: AppColor.secondaryExtraSoft,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
