import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:spendify/config/app_color.dart';
import 'package:spendify/controller/home_controller/home_controller.dart';
import 'package:spendify/utils/language_manager.dart';
import 'package:spendify/widgets/language_toggle_button.dart';
import 'package:spendify/widgets/toast/custom_toast.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Scaffold(
      backgroundColor: AppColor.darkBackground,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColor.whiteColor,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          getLanguage().profile,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Info Section
            _buildUserInfoSection(controller),
            const SizedBox(height: 24),

            const LanguageToggleButton(),
            const SizedBox(height: 16),

            // Balance Section
            _buildBalanceSection(controller),
            const SizedBox(height: 24),

            // Recent Transactions Section
            _buildRecentTransactionsSection(controller),
            const SizedBox(height: 24),

            // Logout Button
            _buildLogoutButton(controller),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfoSection(HomeController controller) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: AppColor.darkGradientAlt,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            getLanguage().user_information,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ListTile(
            leading: const Icon(Icons.person, color: Colors.white),
            title: Text(
              controller.userName.value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              controller.userEmail.value,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.8),
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceSection(HomeController controller) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: AppColor.darkGradientAlt,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            getLanguage().total_balance,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Obx(() => Text(
                '${NumberFormat.currency(symbol: '').format(controller.totalBalance.value)} ₫',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildRecentTransactionsSection(HomeController controller) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColor.darkSurface, AppColor.darkBackground],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            getLanguage().recent_transactions,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Obx(() {
            if (controller.transactions.isEmpty) {
              return Center(
                child: Text(
                  getLanguage().no_transactions_yet,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              );
            }
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.transactions.take(5).length,
              itemBuilder: (context, index) {
                final transaction = controller.transactions[index];
                return ListTile(
                  leading: Icon(
                    transaction['type'] == 'income'
                        ? Icons.arrow_upward
                        : Icons.arrow_downward,
                    color: transaction['type'] == 'income'
                        ? Colors.green
                        : Colors.red,
                  ),
                  title: Text(
                    transaction['description'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    "${transaction['amount'].toStringAsFixed(2)}₫",
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.8),
                      fontSize: 14,
                    ),
                  ),
                  trailing: Text(
                    DateFormat("d MMM, y")
                        .format(DateTime.parse(transaction['date'])),
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.6),
                      fontSize: 12,
                    ),
                  ),
                );
              },
            );
          }),
        ],
      ),
    );
  }

  Widget _buildLogoutButton(HomeController controller) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          await controller.signOut();
          CustomToast.successToast(
              getLanguage().title_success, getLanguage().logout_success);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red.withValues(alpha: 0.8),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          getLanguage().log_out,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
