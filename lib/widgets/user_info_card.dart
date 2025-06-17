import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:intl/intl.dart';
import 'package:spendify/controller/home_controller/home_controller.dart';
import 'package:spendify/utils/language_manager.dart';
import 'package:spendify/utils/utils.dart';

class UserInfoCard extends StatelessWidget {
  final double size;

  const UserInfoCard({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2E86C1), Color(0xFF1F618D)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                getLanguage().total_balance,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
              Obx(() => GestureDetector(
                    onTap: () => controller.toggleVisibility(),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            controller.isAmountVisible.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.white,
                            size: 12,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            controller.isAmountVisible.value
                                ? getLanguage().hide
                                : getLanguage().show,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
          const SizedBox(height: 12),
          Obx(() {
            return AutoSizeText(
              controller.isAmountVisible.value
                  ? '${NumberFormat.currency(symbol: '').format(controller.totalBalance.value)} ₫'
                  : '•••••₫',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              minFontSize: 12,
            );
          }),
          const SizedBox(height: 20),
          Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: _buildBalanceInfoItem(
                      label: getLanguage().income,
                      value: controller.isAmountVisible.value
                          ? formatCurrency(controller.totalIncome.value)
                          : '•••••₫',
                      iconData: Icons.arrow_upward_rounded,
                      color: const Color(0xFF4CAF50),
                    ),
                  ),
                  Expanded(
                    child: _buildBalanceInfoItem(
                      label: getLanguage().expense,
                      value: controller.isAmountVisible.value
                          ? formatCurrency(controller.totalExpense.value)
                          : '•••••₫',
                      iconData: Icons.arrow_downward_rounded,
                      color: const Color(0xFFF44336),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget _buildBalanceInfoItem({
    required String label,
    required String value,
    required IconData iconData,
    required Color color,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            iconData,
            color: Colors.white,
            size: 16,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.7),
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 4),
              AutoSizeText(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                minFontSize: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
