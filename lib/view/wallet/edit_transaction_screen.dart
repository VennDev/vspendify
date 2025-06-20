import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spendify/config/app_color.dart';
import 'package:spendify/controller/wallet_controller/wallet_controller.dart';
import 'package:spendify/model/categories_model.dart';
import 'package:spendify/utils/language_manager.dart';

class EditTransactionScreen extends StatelessWidget {
  final Map<String, dynamic> transaction;
  final List<CategoriesModel> categoryList;

  const EditTransactionScreen({
    super.key,
    required this.transaction,
    required this.categoryList,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TransactionController>();
    controller.amountController.text = transaction['amount'].toString();
    controller.titleController.text = transaction['description'];
    controller.selectedCategory.value = transaction['category'];
    controller.selectedType.value = transaction['type'];
    controller.selectedDate.value = transaction['date'];

    return Scaffold(
      backgroundColor: AppColor.darkBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          getLanguage().edit_transaction,
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
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Add your form fields here (e.g., amount, description, category, etc.)
            // Use the same form fields as in your `TransactionController`.
            // Example:
            TextField(
              controller: controller.amountController,
              decoration: InputDecoration(
                labelText: getLanguage().amount,
                labelStyle: const TextStyle(color: Colors.white),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller.titleController,
              decoration: InputDecoration(
                labelText: getLanguage().description,
                labelStyle: const TextStyle(color: Colors.white),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16),
            // Add other fields like category, type, and date picker
            // ...

            // Save Button
            ElevatedButton(
              onPressed: () async {
                await controller.updateTransaction(transaction['id']);
                await Future.delayed(const Duration(seconds: 1));
                Get.back(); // Go back to the details screen
              },
              child: Text(getLanguage().save_and_change),
            ),
          ],
        ),
      ),
    );
  }
}
