import 'package:get/get.dart';
import 'package:spendify/generated/l10n.dart';

S getLanguage() {
  return S.of(Get.context!);
}

String toEngCategory(String category) {
  var eating = getLanguage().food_and_drink;
  var billsAndFees = getLanguage().bills_and_fees;
  var shopping = getLanguage().shopping;
  var housing = getLanguage().housing;
  var transportation = getLanguage().transportation;
  var health = getLanguage().health;
  var entertainment = getLanguage().entertainment;
  var personal = getLanguage().personal;
  var education = getLanguage().education;
  var travel = getLanguage().travel;
  var utilities = getLanguage().utilities;
  var food = getLanguage().food_and_dining;
  var investment = getLanguage().investment;
  var salary = getLanguage().salary;
  var business = getLanguage().business;

  if (category == eating) {
    return 'Food & Drinks';
  } else if (category == billsAndFees) {
    return 'Bills & Fees';
  } else if (category == shopping) {
    return 'Shopping';
  } else if (category == housing) {
    return 'Housing';
  } else if (category == transportation) {
    return 'Transportation';
  } else if (category == health) {
    return 'Health';
  } else if (category == entertainment) {
    return 'Entertainment';
  } else if (category == personal) {
    return 'Personal';
  } else if (category == education) {
    return 'Education';
  } else if (category == travel) {
    return 'Travel';
  } else if (category == utilities) {
    return 'Utilities';
  } else if (category == food) {
    return 'Food & Dining';
  } else if (category == investment) {
    return 'Investments';
  } else if (category == salary) {
    return 'Salary';
  } else if (category == business) {
    return 'Business';
  }
  return category; // Return the original category if no match found
}

String toEngType(String type) {
  if (type == getLanguage().expense) {
    return 'expense';
  } else if (type == getLanguage().income) {
    return 'income';
  }
  return type; // Return the original type if no match found
}
