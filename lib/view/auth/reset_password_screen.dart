import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spendify/config/app_color.dart';
import 'package:spendify/controller/auth_controller/login_controller.dart';
import 'package:spendify/main.dart';
import 'package:spendify/routes/app_pages.dart';
import 'package:spendify/utils/language_manager.dart';
import 'package:spendify/utils/size_helpers.dart';
import 'package:spendify/utils/utils.dart';
import 'package:spendify/widgets/custom_button.dart';
import 'package:spendify/widgets/toast/custom_toast.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:app_links/app_links.dart';
import 'dart:async';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _passwordController = TextEditingController();
  final controller = Get.find<LoginController>();
  StreamSubscription? _sub;
  String? _accessToken;
  final _appLinks = AppLinks();
  String? _email;
  bool _hasValidSession = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _handleInitialDeepLink();
    _handleIncomingLinks();
  }

  Future<void> _handleInitialDeepLink() async {
    final args = Get.arguments;
    if (args != null) {
      _email = args['email'] as String?;
      if (args['recovery_token'] != null) {
        await _verifyRecoveryToken(args['recovery_token'] as String);
      } else {
        print('No recovery_token in initial arguments');
      }
    } else {
      print('No arguments provided');
    }
  }

  Future<void> _verifyRecoveryToken(String token) async {
    if (_email == null) {
      print('Email is required for verification');
      setState(() {
        _error = 'Email not provided. Please request a new reset link.';
      });
      return;
    }
    try {
      print('Attempting to verify recovery token: $token for email: $_email');
      final response = await supabaseC.auth
          .verifyOTP(
        email: _email!,
        token: token, // Sử dụng token từ deep link
        type: OtpType.recovery,
      )
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw Exception('Request timed out');
      });
      _accessToken = response.session?.accessToken;
      if (_accessToken == null) {
        print('No access_token in response');
        setState(() {
          _error = 'Failed to retrieve session. Please try again.';
        });
      } else {
        print('Verified access_token: $_accessToken');
        setState(() {
          _hasValidSession = true;
        });
      }
    } catch (e) {
      print('Error verifying recovery token: $e');
      setState(() {
        _error = 'Error verifying token: $e';
      });
    }
  }

  void _handleIncomingLinks() {
    _sub = _appLinks.uriLinkStream.listen((Uri? uri) async {
      if (uri != null) {
        print('Received deep link while running: $uri');
        final queryParams = uri.queryParameters;
        final args = Get.arguments;
        _email = args?['email'] as String?;
        if (queryParams.containsKey('code')) {
          await _verifyRecoveryToken(queryParams['code']!);
        } else if (queryParams.containsKey('token')) {
          await _verifyRecoveryToken(queryParams['token']!);
        } else {
          print('No code or token found in deep link');
          setState(() {
            _error = 'Invalid deep link. Missing code or token.';
          });
        }
      }
    }, onError: (err) {
      print('Deep link error: $err');
      setState(() {
        _error = 'Deep link error: $err';
      });
    });
  }

  Future<void> _updatePassword() async {
    if (_accessToken == null || !_hasValidSession) {
      CustomToast.errorToast(
          getLanguage().title_error, _error ?? getLanguage().cannot_find_token);
      return;
    }
    try {
      controller.isLoading.value = true;
      final response = await supabaseC.auth.setSession(_accessToken!);
      if (response.session == null) {
        throw Exception('Failed to set session');
      }
      await supabaseC.auth.updateUser(
        UserAttributes(password: _passwordController.text.trim()),
      );
      CustomToast.successToast(getLanguage().title_success,
          getLanguage().password_updated_successfully);
      Get.offAllNamed(Routes.LOGIN);
    } catch (error) {
      CustomToast.errorToast(getLanguage().title_error, error.toString());
    } finally {
      controller.isLoading.value = false;
    }
  }

  @override
  void dispose() {
    _sub?.cancel();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_error != null) {
      return Scaffold(
        body: Center(
          child: Text(
            _error!,
            style: const TextStyle(color: Colors.red, fontSize: 16),
          ),
        ),
      );
    }

    if (!_hasValidSession) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          getLanguage().reset_password_title,
          style: const TextStyle(
            fontSize: 24,
            fontFamily: 'poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              getLanguage().reset_password_subtitle,
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'poppins',
                fontWeight: FontWeight.w400,
                color: AppColor.secondarySoft,
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
                border:
                    Border.all(width: 1, color: AppColor.secondaryExtraSoft),
              ),
              child: TextField(
                style: const TextStyle(fontSize: 14, fontFamily: 'poppins'),
                maxLines: 1,
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  label: Text(
                    getLanguage().password,
                    style: TextStyle(
                      color: AppColor.secondarySoft,
                      fontSize: 14,
                    ),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: InputBorder.none,
                  hintText: "*************",
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
                      ? getLanguage().update_password
                      : getLanguage().updating_password,
                  onPressed: _updatePassword,
                  bgcolor: AppColor.primary,
                  height: displayHeight(context) * 0.08,
                  width: displayWidth(context),
                  textSize: 16,
                  textColor: Colors.white,
                )),
          ],
        ),
      ),
    );
  }
}
