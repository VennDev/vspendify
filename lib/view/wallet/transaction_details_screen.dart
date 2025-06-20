import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:spendify/config/app_color.dart';
import 'package:spendify/controller/home_controller/home_controller.dart';
import 'package:spendify/controller/wallet_controller/wallet_controller.dart';
import 'package:spendify/model/categories_model.dart';
import 'package:spendify/utils/language_manager.dart';
import 'package:spendify/view/wallet/edit_transaction_screen.dart';

class TransactionDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> transaction;
  final List<CategoriesModel> categoryList;

  const TransactionDetailsScreen({
    super.key,
    required this.transaction,
    required this.categoryList,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    final transactionController = Get.find<TransactionController>();
    final isExpense = transaction['type'] == 'expense';
    final category = transaction['category'];
    final amount = transaction['amount'].toString();
    final date = DateTime.parse(transaction['date']);

    return Scaffold(
      backgroundColor: AppColor.darkBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          getLanguage().transaction_details,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white),
            onPressed: () async {
              final result = await Get.to(
                () => EditTransactionScreen(
                  transaction: transaction,
                  categoryList: categoryList,
                ),
              );

              // Refresh the transaction details if the transaction was updated
              if (result == true) {
                // Fetch updated transaction details
                await controller.getTransactions();
              }

              Get.back();
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () async {
              final confirmMessage = getLanguage().confirm_delete_transaction;
              final confirm = await Get.dialog(
                AlertDialog(
                  backgroundColor: AppColor.darkSurface,
                  title: Text(
                    getLanguage().delete_transaction,
                    style: const TextStyle(color: Colors.white),
                  ),
                  content: Text(
                    confirmMessage,
                    style: const TextStyle(color: Colors.white),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Get.back(result: false),
                      child: Text(
                        getLanguage().cancel,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Get.back(result: true),
                      child: Text(
                        getLanguage().delete,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              );

              if (confirm == true) {
                // Delete the transaction
                await transactionController
                    .deleteTransaction(transaction['id'].toString());
                await Future.delayed(const Duration(seconds: 1));
                Get.back(); // Navigate back to the previous screen
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category Icon and Title
            Center(
              child: Column(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          _getCategoryColor(category, isExpense)
                              .withValues(alpha: 0.2),
                          _getCategoryColor(category, isExpense)
                              .withValues(alpha: 0.1),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      controller.getCategoryIcon(category, categoryList),
                      color: _getCategoryColor(category, isExpense),
                      size: 40,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    transaction['description'].toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Transaction Details
            _buildDetailRow(
                getLanguage().amount, isExpense ? "-$amount₫" : "+$amount₫"),
            _buildDetailRow(
                getLanguage().category, _getTranslatedCategory(category)),
            _buildDetailRow(getLanguage().type,
                isExpense ? getLanguage().expense : getLanguage().income),
            _buildDetailRow(
                getLanguage().date, DateFormat("d MMM, y").format(date)),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.6),
                fontSize: 16,
              ),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  String _getTranslatedCategory(String category) {
    final Map<String, String> categoryTranslations = {
      'food': getLanguage().food_and_drink,
      'shopping': getLanguage().shopping,
      'transport': getLanguage().transport,
      'entertainment': getLanguage().entertainment,
      'bills': getLanguage().bills_and_fees,
      'health': getLanguage().health,
      'education': getLanguage().education,
      'other': getLanguage().other,
    };

    return categoryTranslations[category.toLowerCase()] ?? category;
  }

  Color _getCategoryColor(String category, bool isExpense) {
    if (!isExpense) {
      return AppColor.success;
    }

    final Map<String, Color> categoryColors = {
      'food': Colors.orange,
      'shopping': Colors.purple,
      'transport': Colors.blue,
      'entertainment': Colors.pink,
      'bills': Colors.red,
      'health': Colors.green,
      'education': Colors.teal,
      'other': AppColor.primary,
    };

    return categoryColors[category.toLowerCase()] ?? AppColor.primary;
  }
}
