import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:spendify/model/categories_model.dart';
import 'package:spendify/utils/language_manager.dart';

enum RotationDirection { clockwise, counterclockwise }

enum StaggeredGridType { square, horizontal, vertical }

extension Direction on RotationDirection {
  bool get isClockwise => this == RotationDirection.clockwise;
}

Widget verticalSpace(double height) {
  return SizedBox(height: height);
}

Widget horizontalSpace(double width) {
  return SizedBox(width: width);
}

extension DurationExtension on int {
  Duration get s => Duration(seconds: this);
  Duration get ms => Duration(milliseconds: this);
}

//30 medium
TextStyle mediumTextStyle(double size, Color color) => GoogleFonts.dmSans(
      textStyle: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w600,
      ),
    );
//72 when big
// 48 when mobile size
TextStyle titleText(double size, Color color) => GoogleFonts.dmSans(
      textStyle: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w700,
      ),
    );

//24
TextStyle normalText(double size, Color color) => GoogleFonts.dmSans(
      textStyle:
          TextStyle(color: color, fontSize: size, fontWeight: FontWeight.w400),
    );

List<CategoriesModel> categoryList = [
  CategoriesModel(
      name: 'Investments',
      icon: Icons.trending_up,
      title: getLanguage().investment),
  CategoriesModel(
      name: 'Health',
      icon: Icons.medical_services_outlined,
      title: getLanguage().health),
  CategoriesModel(
      name: 'Bills & Fees',
      icon: Icons.receipt_long,
      title: getLanguage().bills_and_fees),
  CategoriesModel(
      name: 'Food & Drinks',
      icon: Icons.restaurant,
      title: getLanguage().food_and_drink),
  CategoriesModel(
      name: 'Car', icon: Icons.directions_car, title: getLanguage().car),
  CategoriesModel(
      name: 'Groceries',
      icon: Icons.shopping_cart,
      title: getLanguage().groceries),
  CategoriesModel(
      name: 'Gifts', icon: Icons.card_giftcard, title: getLanguage().gifts),
  CategoriesModel(
      name: 'Transport',
      icon: Icons.transit_enterexit,
      title: getLanguage().transport),
];

String getCategoryTitle(String name) {
  List<CategoriesModel> categoryListNew = [
    CategoriesModel(
        name: 'Investments',
        icon: Icons.trending_up,
        title: getLanguage().investment),
    CategoriesModel(
        name: 'Health',
        icon: Icons.medical_services_outlined,
        title: getLanguage().health),
    CategoriesModel(
        name: 'Bills & Fees',
        icon: Icons.receipt_long,
        title: getLanguage().bills_and_fees),
    CategoriesModel(
        name: 'Food & Drinks',
        icon: Icons.restaurant,
        title: getLanguage().food_and_drink),
    CategoriesModel(
        name: 'Car', icon: Icons.directions_car, title: getLanguage().car),
    CategoriesModel(
        name: 'Groceries',
        icon: Icons.shopping_cart,
        title: getLanguage().groceries),
    CategoriesModel(
        name: 'Gifts', icon: Icons.card_giftcard, title: getLanguage().gifts),
    CategoriesModel(
        name: 'Transport',
        icon: Icons.transit_enterexit,
        title: getLanguage().transport),
  ];
  return categoryListNew
          .firstWhere((element) => element.name == name,
              orElse: () => categoryList[0])
          .title ??
      getLanguage().unknown;
}

String formatCurrency(double amount) {
  if (amount >= 1e9) {
    return '${(amount / 1e9).toStringAsFixed(1)} ${getLanguage().billion} ₫';
  } else if (amount >= 1e6) {
    return '${(amount / 1e6).toStringAsFixed(1)} ${getLanguage().million} ₫';
  } else if (amount >= 1e3) {
    return '${(amount / 1e3).toStringAsFixed(1)} ${getLanguage().thousand} ₫';
  }
  return '${NumberFormat.decimalPattern('vi_VN').format(amount)}₫';
}
