// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Error`
  String get title_error {
    return Intl.message(
      'Error',
      name: 'title_error',
      desc: 'A title for error messages',
      args: [],
    );
  }

  /// `Success`
  String get title_success {
    return Intl.message(
      'Success',
      name: 'title_success',
      desc: 'A title for success messages',
      args: [],
    );
  }

  /// `This week`
  String get this_week {
    return Intl.message(
      'This week',
      name: 'this_week',
      desc: 'Label for the current week',
      args: [],
    );
  }

  /// `This month`
  String get this_month {
    return Intl.message(
      'This month',
      name: 'this_month',
      desc: 'Label for the current month',
      args: [],
    );
  }

  /// `This year`
  String get this_year {
    return Intl.message(
      'This year',
      name: 'this_year',
      desc: 'Label for the current year',
      args: [],
    );
  }

  /// `Last week`
  String get last_week {
    return Intl.message(
      'Last week',
      name: 'last_week',
      desc: 'Label for the previous week',
      args: [],
    );
  }

  /// `Last month`
  String get last_month {
    return Intl.message(
      'Last month',
      name: 'last_month',
      desc: 'Label for the previous month',
      args: [],
    );
  }

  /// `Last year`
  String get last_year {
    return Intl.message(
      'Last year',
      name: 'last_year',
      desc: 'Label for the previous year',
      args: [],
    );
  }

  /// `Monday`
  String get monday {
    return Intl.message(
      'Monday',
      name: 'monday',
      desc: 'Label for Monday',
      args: [],
    );
  }

  /// `Tuesday`
  String get tuesday {
    return Intl.message(
      'Tuesday',
      name: 'tuesday',
      desc: 'Label for Tuesday',
      args: [],
    );
  }

  /// `Wednesday`
  String get wednesday {
    return Intl.message(
      'Wednesday',
      name: 'wednesday',
      desc: 'Label for Wednesday',
      args: [],
    );
  }

  /// `Thursday`
  String get thursday {
    return Intl.message(
      'Thursday',
      name: 'thursday',
      desc: 'Label for Thursday',
      args: [],
    );
  }

  /// `Friday`
  String get friday {
    return Intl.message(
      'Friday',
      name: 'friday',
      desc: 'Label for Friday',
      args: [],
    );
  }

  /// `Saturday`
  String get saturday {
    return Intl.message(
      'Saturday',
      name: 'saturday',
      desc: 'Label for Saturday',
      args: [],
    );
  }

  /// `Sunday`
  String get sunday {
    return Intl.message(
      'Sunday',
      name: 'sunday',
      desc: 'Label for Sunday',
      args: [],
    );
  }

  /// `Jan`
  String get january {
    return Intl.message(
      'Jan',
      name: 'january',
      desc: 'Label for January',
      args: [],
    );
  }

  /// `Feb`
  String get february {
    return Intl.message(
      'Feb',
      name: 'february',
      desc: 'Label for February',
      args: [],
    );
  }

  /// `Mar`
  String get march {
    return Intl.message(
      'Mar',
      name: 'march',
      desc: 'Label for March',
      args: [],
    );
  }

  /// `Apr`
  String get april {
    return Intl.message(
      'Apr',
      name: 'april',
      desc: 'Label for April',
      args: [],
    );
  }

  /// `May`
  String get may {
    return Intl.message(
      'May',
      name: 'may',
      desc: 'Label for May',
      args: [],
    );
  }

  /// `Jun`
  String get june {
    return Intl.message(
      'Jun',
      name: 'june',
      desc: 'Label for June',
      args: [],
    );
  }

  /// `Jul`
  String get july {
    return Intl.message(
      'Jul',
      name: 'july',
      desc: 'Label for July',
      args: [],
    );
  }

  /// `Aug`
  String get august {
    return Intl.message(
      'Aug',
      name: 'august',
      desc: 'Label for August',
      args: [],
    );
  }

  /// `Sep`
  String get september {
    return Intl.message(
      'Sep',
      name: 'september',
      desc: 'Label for September',
      args: [],
    );
  }

  /// `Oct`
  String get october {
    return Intl.message(
      'Oct',
      name: 'october',
      desc: 'Label for October',
      args: [],
    );
  }

  /// `Nov`
  String get november {
    return Intl.message(
      'Nov',
      name: 'november',
      desc: 'Label for November',
      args: [],
    );
  }

  /// `Dec`
  String get december {
    return Intl.message(
      'Dec',
      name: 'december',
      desc: 'Label for December',
      args: [],
    );
  }

  /// `Email and password are required.`
  String get email_and_password_required {
    return Intl.message(
      'Email and password are required.',
      name: 'email_and_password_required',
      desc: 'Error message when email and password are not provided',
      args: [],
    );
  }

  /// `Email and password are required.`
  String get email_and_password_name_required {
    return Intl.message(
      'Email and password are required.',
      name: 'email_and_password_name_required',
      desc: 'Error message when email and password are not provided with name',
      args: [],
    );
  }

  /// `Error while fetching user data.`
  String get error_while_fetching_data_user {
    return Intl.message(
      'Error while fetching user data.',
      name: 'error_while_fetching_data_user',
      desc: 'Error message when there is an issue fetching user data',
      args: [],
    );
  }

  /// `User data not found.`
  String get error_not_found_data_user {
    return Intl.message(
      'User data not found.',
      name: 'error_not_found_data_user',
      desc: 'Error message when user data is not found',
      args: [],
    );
  }

  /// `An unexpected error occurred.`
  String get error_occurs_unexpectedly {
    return Intl.message(
      'An unexpected error occurred.',
      name: 'error_occurs_unexpectedly',
      desc: 'General error message for unexpected issues',
      args: [],
    );
  }

  /// `Login successful.`
  String get login_success {
    return Intl.message(
      'Login successful.',
      name: 'login_success',
      desc: 'Message displayed when login is successful',
      args: [],
    );
  }

  /// `Login failed.`
  String get login_failed {
    return Intl.message(
      'Login failed.',
      name: 'login_failed',
      desc: 'Message displayed when login fails',
      args: [],
    );
  }

  /// `Logout successful.`
  String get logout_success {
    return Intl.message(
      'Logout successful.',
      name: 'logout_success',
      desc: 'Message displayed when logout is successful',
      args: [],
    );
  }

  /// `Cannot fetch transaction data.`
  String get cannot_fetch_transaction_data {
    return Intl.message(
      'Cannot fetch transaction data.',
      name: 'cannot_fetch_transaction_data',
      desc: 'Error message when transaction data cannot be fetched',
      args: [],
    );
  }

  /// `Value money is required.`
  String get value_money_required {
    return Intl.message(
      'Value money is required.',
      name: 'value_money_required',
      desc: 'Error message when value money is not provided',
      args: [],
    );
  }

  /// `Value money is invalid.`
  String get value_money_invalid {
    return Intl.message(
      'Value money is invalid.',
      name: 'value_money_invalid',
      desc: 'Error message when value money is not valid',
      args: [],
    );
  }

  /// `Title is required.`
  String get title_required {
    return Intl.message(
      'Title is required.',
      name: 'title_required',
      desc: 'Error message when title is not provided',
      args: [],
    );
  }

  /// `Choose a category is required.`
  String get choose_category_required {
    return Intl.message(
      'Choose a category is required.',
      name: 'choose_category_required',
      desc: 'Error message when a category is not selected',
      args: [],
    );
  }

  /// `The transaction was created successfully.`
  String get the_transaction_was_created_successfully {
    return Intl.message(
      'The transaction was created successfully.',
      name: 'the_transaction_was_created_successfully',
      desc: 'Message displayed when a transaction is created successfully',
      args: [],
    );
  }

  /// `Cannot create transaction.`
  String get cannot_create_transaction {
    return Intl.message(
      'Cannot create transaction.',
      name: 'cannot_create_transaction',
      desc: 'Error message when a transaction cannot be created',
      args: [],
    );
  }

  /// `The transaction was deleted successfully.`
  String get the_transaction_was_deleted_successfully {
    return Intl.message(
      'The transaction was deleted successfully.',
      name: 'the_transaction_was_deleted_successfully',
      desc: 'Message displayed when a transaction is deleted successfully',
      args: [],
    );
  }

  /// `The transaction cannot be deleted.`
  String get the_transaction_cannot_be_deleted {
    return Intl.message(
      'The transaction cannot be deleted.',
      name: 'the_transaction_cannot_be_deleted',
      desc: 'Error message when a transaction cannot be deleted',
      args: [],
    );
  }

  /// `The transaction was updated successfully.`
  String get the_transaction_was_updated_successfully {
    return Intl.message(
      'The transaction was updated successfully.',
      name: 'the_transaction_was_updated_successfully',
      desc: 'Message displayed when a transaction is updated successfully',
      args: [],
    );
  }

  /// `Cannot update transaction.`
  String get cannot_update_transaction {
    return Intl.message(
      'Cannot update transaction.',
      name: 'cannot_update_transaction',
      desc: 'Error message when a transaction cannot be updated',
      args: [],
    );
  }

  /// `Cannot update balance.`
  String get cannot_update_balance {
    return Intl.message(
      'Cannot update balance.',
      name: 'cannot_update_balance',
      desc: 'Error message when the balance cannot be updated',
      args: [],
    );
  }

  /// `Investment`
  String get investment {
    return Intl.message(
      'Investment',
      name: 'investment',
      desc: 'Label for investment category',
      args: [],
    );
  }

  /// `Health`
  String get health {
    return Intl.message(
      'Health',
      name: 'health',
      desc: 'Label for health category',
      args: [],
    );
  }

  /// `Bills & Fees`
  String get bills_and_fees {
    return Intl.message(
      'Bills & Fees',
      name: 'bills_and_fees',
      desc: 'Label for bills and fees category',
      args: [],
    );
  }

  /// `Food & Drink`
  String get food_and_drink {
    return Intl.message(
      'Food & Drink',
      name: 'food_and_drink',
      desc: 'Label for food and drink category',
      args: [],
    );
  }

  /// `Car`
  String get car {
    return Intl.message(
      'Car',
      name: 'car',
      desc: 'Label for car category',
      args: [],
    );
  }

  /// `Groceries`
  String get groceries {
    return Intl.message(
      'Groceries',
      name: 'groceries',
      desc: 'Label for groceries category',
      args: [],
    );
  }

  /// `Gifts`
  String get gifts {
    return Intl.message(
      'Gifts',
      name: 'gifts',
      desc: 'Label for gifts category',
      args: [],
    );
  }

  /// `Transport`
  String get transport {
    return Intl.message(
      'Transport',
      name: 'transport',
      desc: 'Label for transport category',
      args: [],
    );
  }

  /// `Unknown`
  String get unknown {
    return Intl.message(
      'Unknown',
      name: 'unknown',
      desc: 'Label for unknown category',
      args: [],
    );
  }

  /// `Income`
  String get income {
    return Intl.message(
      'Income',
      name: 'income',
      desc: 'Label for income category',
      args: [],
    );
  }

  /// `Expense`
  String get expense {
    return Intl.message(
      'Expense',
      name: 'expense',
      desc: 'Label for expense category',
      args: [],
    );
  }

  /// `Thousand`
  String get thousand {
    return Intl.message(
      'Thousand',
      name: 'thousand',
      desc: 'Label for thousand',
      args: [],
    );
  }

  /// `Million`
  String get million {
    return Intl.message(
      'Million',
      name: 'million',
      desc: 'Label for million',
      args: [],
    );
  }

  /// `Billion`
  String get billion {
    return Intl.message(
      'Billion',
      name: 'billion',
      desc: 'Label for billion',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dont_have_account {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dont_have_account',
      desc: 'Text prompting users to register if they don\'t have an account',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: 'Button text for navigating to the registration screen',
      args: [],
    );
  }

  /// `Log In`
  String get login_title {
    return Intl.message(
      'Log In',
      name: 'login_title',
      desc: 'Title of the login screen',
      args: [],
    );
  }

  /// `Email`
  String get email_label {
    return Intl.message(
      'Email',
      name: 'email_label',
      desc: 'Label for the email input field',
      args: [],
    );
  }

  /// `youremail@email.com`
  String get email_hint {
    return Intl.message(
      'youremail@email.com',
      name: 'email_hint',
      desc: 'Hint text for the email input field',
      args: [],
    );
  }

  /// `Password`
  String get password_label {
    return Intl.message(
      'Password',
      name: 'password_label',
      desc: 'Label for the password input field',
      args: [],
    );
  }

  /// `*************`
  String get password_hint {
    return Intl.message(
      '*************',
      name: 'password_hint',
      desc: 'Hint text for the password input field',
      args: [],
    );
  }

  /// `Log In`
  String get login_button {
    return Intl.message(
      'Log In',
      name: 'login_button',
      desc: 'Text for the login button',
      args: [],
    );
  }

  /// `Logging In...`
  String get logging_in_button {
    return Intl.message(
      'Logging In...',
      name: 'logging_in_button',
      desc: 'Text for the login button when loading',
      args: [],
    );
  }

  /// `Already have an account?`
  String get already_have_account {
    return Intl.message(
      'Already have an account?',
      name: 'already_have_account',
      desc: 'Text prompting users to log in if they already have an account',
      args: [],
    );
  }

  /// `Create Account`
  String get register_title {
    return Intl.message(
      'Create Account',
      name: 'register_title',
      desc: 'Title of the register screen',
      args: [],
    );
  }

  /// `Name`
  String get name_label {
    return Intl.message(
      'Name',
      name: 'name_label',
      desc: 'Label for the name input field',
      args: [],
    );
  }

  /// `John Doe`
  String get name_hint {
    return Intl.message(
      'John Doe',
      name: 'name_hint',
      desc: 'Hint text for the name input field',
      args: [],
    );
  }

  /// `Register`
  String get register_button {
    return Intl.message(
      'Register',
      name: 'register_button',
      desc: 'Text for the register button',
      args: [],
    );
  }

  /// `Processing...`
  String get processing_button {
    return Intl.message(
      'Processing...',
      name: 'processing_button',
      desc: 'Text for the register button when loading',
      args: [],
    );
  }

  /// `Welcome,`
  String get welcome_message {
    return Intl.message(
      'Welcome,',
      name: 'welcome_message',
      desc: 'Greeting text displayed above the user\'s name',
      args: [],
    );
  }

  /// `??`
  String get fallback_initials {
    return Intl.message(
      '??',
      name: 'fallback_initials',
      desc: 'Fallback text for user initials when the username is empty',
      args: [],
    );
  }

  /// `Recent Transactions`
  String get recent_transactions {
    return Intl.message(
      'Recent Transactions',
      name: 'recent_transactions',
      desc: 'Label for the section showing recent transactions',
      args: [],
    );
  }

  /// `View All`
  String get view_all {
    return Intl.message(
      'View All',
      name: 'view_all',
      desc: 'Button label to view all transactions',
      args: [],
    );
  }

  /// `You don't have any transactions yet`
  String get no_transactions_yet {
    return Intl.message(
      'You don\'t have any transactions yet',
      name: 'no_transactions_yet',
      desc: 'Message displayed when there are no transactions',
      args: [],
    );
  }

  /// `Add your first transaction`
  String get add_first_transaction {
    return Intl.message(
      'Add your first transaction',
      name: 'add_first_transaction',
      desc: 'Button label to prompt adding the first transaction',
      args: [],
    );
  }

  /// `Overview`
  String get overview {
    return Intl.message(
      'Overview',
      name: 'overview',
      desc: 'Label for the overview section of the home screen',
      args: [],
    );
  }

  /// `Load More`
  String get load_more {
    return Intl.message(
      'Load More',
      name: 'load_more',
      desc: 'Button label to load more transactions',
      args: [],
    );
  }

  /// `Control your spending today!`
  String get control_spending_today {
    return Intl.message(
      'Control your spending today!',
      name: 'control_spending_today',
      desc:
          'Main headline on the get started screen encouraging users to manage their spending',
      args: [],
    );
  }

  /// `Discover a smarter way to track your spending with VSpendify.`
  String get discover_smarter_tracking {
    return Intl.message(
      'Discover a smarter way to track your spending with VSpendify.',
      name: 'discover_smarter_tracking',
      desc: 'Description text promoting the app\'s spending tracking feature',
      args: [],
    );
  }

  /// `Get Started`
  String get get_started {
    return Intl.message(
      'Get Started',
      name: 'get_started',
      desc: 'Button label to start using the app',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: 'Title for the profile screen',
      args: [],
    );
  }

  /// `User Information`
  String get user_information {
    return Intl.message(
      'User Information',
      name: 'user_information',
      desc: 'Label for the user information section',
      args: [],
    );
  }

  /// `Balance`
  String get balance {
    return Intl.message(
      'Balance',
      name: 'balance',
      desc: 'Label for the balance section',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message(
      'Success',
      name: 'success',
      desc: 'Title for the success toast message',
      args: [],
    );
  }

  /// `Logged out successfully`
  String get logged_out_successfully {
    return Intl.message(
      'Logged out successfully',
      name: 'logged_out_successfully',
      desc: 'Message displayed in the toast when logout is successful',
      args: [],
    );
  }

  /// `Log Out`
  String get log_out {
    return Intl.message(
      'Log Out',
      name: 'log_out',
      desc: 'Button label for logging out',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: 'Filter label for displaying all transactions',
      args: [],
    );
  }

  /// `Weekly`
  String get weekly {
    return Intl.message(
      'Weekly',
      name: 'weekly',
      desc: 'Filter label for displaying transactions within a week',
      args: [],
    );
  }

  /// `Monthly`
  String get monthly {
    return Intl.message(
      'Monthly',
      name: 'monthly',
      desc: 'Filter label for displaying transactions within a month',
      args: [],
    );
  }

  /// `Transactions`
  String get transactions {
    return Intl.message(
      'Transactions',
      name: 'transactions',
      desc: 'Title for the all transactions screen',
      args: [],
    );
  }

  /// `All Transactions`
  String get all_transactions {
    return Intl.message(
      'All Transactions',
      name: 'all_transactions',
      desc:
          'Label for displaying the date range when all transactions are selected',
      args: [],
    );
  }

  /// `No transactions found`
  String get no_transactions_found {
    return Intl.message(
      'No transactions found',
      name: 'no_transactions_found',
      desc: 'Message displayed when no transactions are found',
      args: [],
    );
  }

  /// `Edit Transaction`
  String get edit_transaction {
    return Intl.message(
      'Edit Transaction',
      name: 'edit_transaction',
      desc: 'Title for the edit transaction screen',
      args: [],
    );
  }

  /// `Amount`
  String get amount {
    return Intl.message(
      'Amount',
      name: 'amount',
      desc: 'Label for the transaction amount input field',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: 'Label for the transaction description input field',
      args: [],
    );
  }

  /// `Save and Change`
  String get save_and_change {
    return Intl.message(
      'Save and Change',
      name: 'save_and_change',
      desc: 'Button label for saving changes to a transaction',
      args: [],
    );
  }

  /// `Select Year`
  String get select_year {
    return Intl.message(
      'Select Year',
      name: 'select_year',
      desc: 'Label for the year selection dialog',
      args: [],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message(
      'Apply',
      name: 'apply',
      desc: 'Button label to confirm year selection',
      args: [],
    );
  }

  /// `Financial Statistics`
  String get financial_statistics {
    return Intl.message(
      'Financial Statistics',
      name: 'financial_statistics',
      desc: 'Title for the statistics screen',
      args: [],
    );
  }

  /// `Monthly Trends`
  String get monthly_trends {
    return Intl.message(
      'Monthly Trends',
      name: 'monthly_trends',
      desc: 'Label for the monthly trends section',
      args: [],
    );
  }

  /// `Your savings are increasing`
  String get savings_increasing {
    return Intl.message(
      'Your savings are increasing',
      name: 'savings_increasing',
      desc: 'Message indicating an increase in savings',
      args: [],
    );
  }

  /// `You have improved your savings rate by {percentage}% compared to the previous month`
  String savings_improvement(Object percentage) {
    return Intl.message(
      'You have improved your savings rate by $percentage% compared to the previous month',
      name: 'savings_improvement',
      desc:
          'Message showing the percentage improvement in savings compared to the previous month',
      args: [percentage],
    );
  }

  /// `Current Balance`
  String get current_balance {
    return Intl.message(
      'Current Balance',
      name: 'current_balance',
      desc: 'Label for the current balance card',
      args: [],
    );
  }

  /// `Available to Spend`
  String get available_to_spend {
    return Intl.message(
      'Available to Spend',
      name: 'available_to_spend',
      desc: 'Label indicating a positive balance',
      args: [],
    );
  }

  /// `Negative Balance`
  String get negative_balance {
    return Intl.message(
      'Negative Balance',
      name: 'negative_balance',
      desc: 'Label indicating a negative balance',
      args: [],
    );
  }

  /// `Income vs Expense`
  String get income_vs_expense {
    return Intl.message(
      'Income vs Expense',
      name: 'income_vs_expense',
      desc: 'Label for the income vs expense chart section',
      args: [],
    );
  }

  /// `Spending Breakdown`
  String get spending_breakdown {
    return Intl.message(
      'Spending Breakdown',
      name: 'spending_breakdown',
      desc: 'Label for the spending breakdown section',
      args: [],
    );
  }

  /// `Top Categories`
  String get top_categories {
    return Intl.message(
      'Top Categories',
      name: 'top_categories',
      desc: 'Label for the top categories section',
      args: [],
    );
  }

  /// `Food & Dining`
  String get food_and_dining {
    return Intl.message(
      'Food & Dining',
      name: 'food_and_dining',
      desc: 'Category name for food and dining expenses',
      args: [],
    );
  }

  /// `Shopping`
  String get shopping {
    return Intl.message(
      'Shopping',
      name: 'shopping',
      desc: 'Category name for shopping expenses',
      args: [],
    );
  }

  /// `Housing`
  String get housing {
    return Intl.message(
      'Housing',
      name: 'housing',
      desc: 'Category name for housing expenses',
      args: [],
    );
  }

  /// `Transportation`
  String get transportation {
    return Intl.message(
      'Transportation',
      name: 'transportation',
      desc: 'Category name for transportation expenses',
      args: [],
    );
  }

  /// `Entertainment`
  String get entertainment {
    return Intl.message(
      'Entertainment',
      name: 'entertainment',
      desc: 'Category name for entertainment expenses',
      args: [],
    );
  }

  /// `Personal`
  String get personal {
    return Intl.message(
      'Personal',
      name: 'personal',
      desc: 'Category name for personal expenses',
      args: [],
    );
  }

  /// `Education`
  String get education {
    return Intl.message(
      'Education',
      name: 'education',
      desc: 'Category name for education expenses',
      args: [],
    );
  }

  /// `Travel`
  String get travel {
    return Intl.message(
      'Travel',
      name: 'travel',
      desc: 'Category name for travel expenses',
      args: [],
    );
  }

  /// `Utilities`
  String get utilities {
    return Intl.message(
      'Utilities',
      name: 'utilities',
      desc: 'Category name for utilities expenses',
      args: [],
    );
  }

  /// `Salary`
  String get salary {
    return Intl.message(
      'Salary',
      name: 'salary',
      desc: 'Category name for salary income',
      args: [],
    );
  }

  /// `Business`
  String get business {
    return Intl.message(
      'Business',
      name: 'business',
      desc: 'Category name for business income or expenses',
      args: [],
    );
  }

  /// `Transaction Details`
  String get transaction_details {
    return Intl.message(
      'Transaction Details',
      name: 'transaction_details',
      desc: 'Title for the transaction details screen',
      args: [],
    );
  }

  /// `Delete Transaction`
  String get delete_transaction {
    return Intl.message(
      'Delete Transaction',
      name: 'delete_transaction',
      desc: 'Title for the delete transaction confirmation dialog',
      args: [],
    );
  }

  /// `Are you sure you want to delete this transaction?`
  String get confirm_delete_transaction {
    return Intl.message(
      'Are you sure you want to delete this transaction?',
      name: 'confirm_delete_transaction',
      desc: 'Message in the delete transaction confirmation dialog',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: 'Button label to cancel the delete action',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: 'Button label to confirm deletion of a transaction',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message(
      'Category',
      name: 'category',
      desc: 'Label for the transaction category field',
      args: [],
    );
  }

  /// `Type`
  String get type {
    return Intl.message(
      'Type',
      name: 'type',
      desc: 'Label for the transaction type field',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: 'Label for the transaction date field',
      args: [],
    );
  }

  /// `Bills`
  String get bills {
    return Intl.message(
      'Bills',
      name: 'bills',
      desc: 'Category name for bills expenses',
      args: [],
    );
  }

  /// `Other`
  String get other {
    return Intl.message(
      'Other',
      name: 'other',
      desc: 'Category name for other expenses',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc:
          'Label for the password input field in the admin confirmation dialog',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: 'Button label to confirm an action in a dialog',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: 'Default title for error toast notifications',
      args: [],
    );
  }

  /// `Add your error message here`
  String get error_message_placeholder {
    return Intl.message(
      'Add your error message here',
      name: 'error_message_placeholder',
      desc: 'Default message for error toast notifications',
      args: [],
    );
  }

  /// `Add your success message here`
  String get success_message_placeholder {
    return Intl.message(
      'Add your success message here',
      name: 'success_message_placeholder',
      desc: 'Default message for success toast notifications',
      args: [],
    );
  }

  /// `Home`
  String get title_home {
    return Intl.message(
      'Home',
      name: 'title_home',
      desc: 'Title for the home screen',
      args: [],
    );
  }

  /// `Statistics`
  String get title_statistics {
    return Intl.message(
      'Statistics',
      name: 'title_statistics',
      desc: 'Title for the statistics screen',
      args: [],
    );
  }

  /// `No transactions in this year`
  String get no_transactions_in_year {
    return Intl.message(
      'No transactions in this year',
      name: 'no_transactions_in_year',
      desc:
          'Message displayed when there are no transactions for the selected year',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: 'Label for the total amount of transactions in a category',
      args: [],
    );
  }

  /// `Income Amount`
  String get income_amount {
    return Intl.message(
      'Income Amount',
      name: 'income_amount',
      desc: 'Label for the income amount input field',
      args: [],
    );
  }

  /// `Expense Amount`
  String get expense_amount {
    return Intl.message(
      'Expense Amount',
      name: 'expense_amount',
      desc: 'Label for the expense amount input field',
      args: [],
    );
  }

  /// `Receipt or Salary`
  String get receipt_or_salary {
    return Intl.message(
      'Receipt or Salary',
      name: 'receipt_or_salary',
      desc: 'Category name for receipt or salary transactions',
      args: [],
    );
  }

  /// `Food or Drink`
  String get food_or_drink {
    return Intl.message(
      'Food or Drink',
      name: 'food_or_drink',
      desc: 'Category name for food or drink transactions',
      args: [],
    );
  }

  /// `Vehicle`
  String get vehicle {
    return Intl.message(
      'Vehicle',
      name: 'vehicle',
      desc: 'Category name for vehicle-related transactions',
      args: [],
    );
  }

  /// `Gift`
  String get gift {
    return Intl.message(
      'Gift',
      name: 'gift',
      desc: 'Category name for gift transactions',
      args: [],
    );
  }

  /// `Transaction Date`
  String get transaction_date {
    return Intl.message(
      'Transaction Date',
      name: 'transaction_date',
      desc: 'Label for the transaction date input field',
      args: [],
    );
  }

  /// `Enter Transaction Name`
  String get enter_transaction_name {
    return Intl.message(
      'Enter Transaction Name',
      name: 'enter_transaction_name',
      desc: 'Hint text for the transaction name input field',
      args: [],
    );
  }

  /// `Add Transaction`
  String get add_transaction {
    return Intl.message(
      'Add Transaction',
      name: 'add_transaction',
      desc: 'Button label to submit a new transaction',
      args: [],
    );
  }

  /// `Processing...`
  String get processing {
    return Intl.message(
      'Processing...',
      name: 'processing',
      desc:
          'Text displayed on the submit button while processing a transaction',
      args: [],
    );
  }

  /// `Total Balance`
  String get total_balance {
    return Intl.message(
      'Total Balance',
      name: 'total_balance',
      desc: 'Label for the total balance display',
      args: [],
    );
  }

  /// `Hide`
  String get hide {
    return Intl.message(
      'Hide',
      name: 'hide',
      desc: 'Label for hiding the balance amount',
      args: [],
    );
  }

  /// `Show`
  String get show {
    return Intl.message(
      'Show',
      name: 'show',
      desc: 'Label for showing the balance amount',
      args: [],
    );
  }

  /// `Saving`
  String get saving {
    return Intl.message(
      'Saving',
      name: 'saving',
      desc: 'Label for the saving category',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forgot_password_title {
    return Intl.message(
      'Forgot Password',
      name: 'forgot_password_title',
      desc: 'Title for the forgot password screen',
      args: [],
    );
  }

  /// `Send Reset Link`
  String get send_reset_link {
    return Intl.message(
      'Send Reset Link',
      name: 'send_reset_link',
      desc: 'Button label to send a password reset link',
      args: [],
    );
  }

  /// `Sending Reset Link...`
  String get sending_reset_link {
    return Intl.message(
      'Sending Reset Link...',
      name: 'sending_reset_link',
      desc: 'Text displayed on the send reset link button while processing',
      args: [],
    );
  }

  /// `Enter your email address to receive a password reset link.`
  String get forgot_password_subtitle {
    return Intl.message(
      'Enter your email address to receive a password reset link.',
      name: 'forgot_password_subtitle',
      desc: 'Subtitle for the forgot password screen',
      args: [],
    );
  }

  /// `Update Password`
  String get update_password {
    return Intl.message(
      'Update Password',
      name: 'update_password',
      desc: 'Title for the update password screen',
      args: [],
    );
  }

  /// `Updating Password...`
  String get updating_password {
    return Intl.message(
      'Updating Password...',
      name: 'updating_password',
      desc: 'Text displayed on the update password button while processing',
      args: [],
    );
  }

  /// `Enter your new password to reset your account.`
  String get reset_password_subtitle {
    return Intl.message(
      'Enter your new password to reset your account.',
      name: 'reset_password_subtitle',
      desc: 'Subtitle for the reset password screen',
      args: [],
    );
  }

  /// `Reset Password`
  String get reset_password_title {
    return Intl.message(
      'Reset Password',
      name: 'reset_password_title',
      desc: 'Title for the reset password screen',
      args: [],
    );
  }

  /// `Password updated successfully.`
  String get password_updated_successfully {
    return Intl.message(
      'Password updated successfully.',
      name: 'password_updated_successfully',
      desc: 'Message displayed when the password is updated successfully',
      args: [],
    );
  }

  /// `Cannot find the token.`
  String get cannot_find_token {
    return Intl.message(
      'Cannot find the token.',
      name: 'cannot_find_token',
      desc: 'Error message when the token for password reset is not found',
      args: [],
    );
  }

  /// `Cannot process the request.`
  String get cannot_proccess_request {
    return Intl.message(
      'Cannot process the request.',
      name: 'cannot_proccess_request',
      desc: 'Error message when the request cannot be processed',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
