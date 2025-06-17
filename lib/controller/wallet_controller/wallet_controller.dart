import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spendify/controller/home_controller/home_controller.dart';
import 'package:spendify/main.dart';
import 'package:spendify/utils/language_manager.dart';
import 'package:spendify/widgets/toast/custom_toast.dart';

class TransactionController extends GetxController {
  final amountController = TextEditingController();
  var selectedCategory = ''.obs;
  final titleController = TextEditingController();
  final selectedType = 'income'.obs;
  var isLoading = false.obs;
  var isSubmitted = false.obs;
  var selectedDate = DateTime.now().toIso8601String().obs;
  final homeC = Get.find<HomeController>();

  @override
  void dispose() {
    super.dispose();
    amountController.dispose();
    titleController.dispose();
  }

  Future<void> addResource() async {
    try {
      // Validate inputs first
      if (amountController.text.isEmpty) {
        CustomToast.errorToast(
            getLanguage().title_error, getLanguage().value_money_required);
        return;
      }

      if (titleController.text.isEmpty) {
        CustomToast.errorToast(
            getLanguage().title_error, getLanguage().title_required);
        return;
      }

      if (selectedCategory.value.isEmpty) {
        CustomToast.errorToast(
            getLanguage().title_error, getLanguage().choose_category_required);
        return;
      }

      isSubmitted.value = true;
      isLoading.value = true;
      var currentUser = supabaseC.auth.currentUser;

      // Parse amount from String to double
      double amount;
      try {
        amount = double.parse(amountController.text);
      } catch (e) {
        CustomToast.errorToast(
            getLanguage().title_error, getLanguage().value_money_invalid);
        return;
      }

      // Add resource
      await supabaseC.from('transactions').insert({
        'user_id': currentUser!.id,
        'amount': amount,
        'description': titleController.text,
        'type': toEngType(selectedType.value),
        'category': toEngCategory(selectedCategory.value),
        'date': selectedDate.value,
      });

      // Update balance based on transaction type
      await updateBalance(amount, toEngType(selectedType.value));

      // Fetch complete balance data first (to fix the main issue)
      await homeC.fetchTotalBalanceData();

      // Then get paginated transactions for display
      await homeC.getTransactions();

      // Clear form
      resetForm();
      selectedType.value = 'income'; // Reset to default

      // Close the current screen
      Get.back();

      // Show success message
      CustomToast.successToast(getLanguage().title_success,
          getLanguage().the_transaction_was_created_successfully);
    } catch (e) {
      // Log the error for debugging
      debugPrint("Lỗi trong addResource: $e");

      // Show error message if transaction submission fails
      CustomToast.errorToast(getLanguage().title_error,
          getLanguage().cannot_fetch_transaction_data);
    } finally {
      isLoading.value = false;
      isSubmitted.value = false;
    }
  }

  void resetForm() {
    amountController.clear();
    titleController.clear();
    selectedCategory.value = '';
    selectedDate.value = DateTime.now().toIso8601String();
  }

  Future<void> updateBalance(double amount, String type) async {
    try {
      final response = await supabaseC
          .from("users")
          .select('balance')
          .eq('id', supabaseC.auth.currentUser!.id)
          .single();

      final currentBalance = (response['balance'] as num).toDouble();
      final newBalance =
          type == 'income' ? currentBalance + amount : currentBalance - amount;

      await supabaseC.from("users").update({'balance': newBalance}).eq(
          'id', supabaseC.auth.currentUser!.id);

      // Update local value
      homeC.totalBalance.value = newBalance;

      debugPrint(
          "Số dư của người dùng đã được cập nhật thành công thành: $newBalance");
    } catch (error) {
      debugPrint("Lỗi khi cập nhật số dư của người dùng: $error");
      CustomToast.errorToast(
          getLanguage().title_error, getLanguage().cannot_update_balance);
    }
  }

  // This method is redundant with addResource and should be removed or merged
  Future<void> addTransaction() async {
    // Recommend removing this method as it duplicates functionality and
    // doesn't use the improved balance calculation logic
    await addResource();
  }

  Future<void> deleteTransaction(String transactionId) async {
    try {
      // Fetch the transaction to get its amount and type
      final response = await supabaseC
          .from('transactions')
          .select()
          .eq('id', transactionId)
          .single();

      final amount = response['amount'] is num
          ? (response['amount'] as num).toDouble()
          : 0.0;
      final type = response['type'] as String;

      // Delete the transaction
      await supabaseC.from('transactions').delete().eq('id', transactionId);

      // Update the balance
      final currentBalance = homeC.totalBalance.value;
      if (type == 'income') {
        homeC.totalBalance.value = currentBalance - amount; // Subtract income
      } else {
        homeC.totalBalance.value = currentBalance + amount; // Add back expense
      }

      // Refresh transactions and balance
      await homeC.getTransactions();
      await homeC.fetchTotalBalanceData();

      CustomToast.successToast(getLanguage().title_success,
          getLanguage().the_transaction_was_deleted_successfully);
      await Future.delayed(const Duration(seconds: 1));
      Get.back(); // Navigate back to the previous screen
    } catch (e) {
      print("Error deleting transaction: $e");
      CustomToast.errorToast(getLanguage().title_error,
          getLanguage().the_transaction_cannot_be_deleted);
    }
  }

  Future<void> updateTransaction(String transactionId) async {
    try {
      // Fetch the old transaction to get its amount and type
      final oldTransaction = await supabaseC
          .from('transactions')
          .select()
          .eq('id', transactionId)
          .single();

      final oldAmount = oldTransaction['amount'] is num
          ? (oldTransaction['amount'] as num).toDouble()
          : 0.0;
      final oldType = oldTransaction['type'] as String;

      // Parse the new amount
      final newAmount = double.tryParse(amountController.text) ?? 0.0;
      final newType = toEngType(selectedType.value);

      // Update the transaction
      await supabaseC.from('transactions').update({
        'amount': newAmount,
        'description': titleController.text,
        'category': toEngCategory(selectedCategory.value),
        'type': newType,
        'date': selectedDate.value,
      }).eq('id', transactionId);

      // Update the balance
      final currentBalance = homeC.totalBalance.value;

      if (oldType == 'income') {
        homeC.totalBalance.value =
            currentBalance - oldAmount; // Subtract old income
      } else {
        homeC.totalBalance.value =
            currentBalance + oldAmount; // Add back old expense
      }

      if (newType == 'income') {
        homeC.totalBalance.value = currentBalance + newAmount; // Add new income
      } else {
        homeC.totalBalance.value =
            currentBalance - newAmount; // Subtract new expense
      }

      // Refresh transactions and balance
      await homeC.getTransactions();
      await homeC.fetchTotalBalanceData();

      CustomToast.successToast(getLanguage().title_success,
          getLanguage().the_transaction_was_updated_successfully);
      await Future.delayed(const Duration(seconds: 1));
      Get.back(); // Navigate back to the previous screen
    } catch (e) {
      CustomToast.errorToast(
          getLanguage().title_error, getLanguage().cannot_update_transaction);
    }
  }
}
