import 'package:get/get.dart';
import 'package:spendify/view/auth/forgot_password_screen.dart';
import 'package:spendify/view/auth/login_screen.dart';
import 'package:spendify/view/auth/register_screen.dart';
import 'package:spendify/view/auth/reset_password_screen.dart';
import 'package:spendify/view/home/home_screen.dart';
import 'package:spendify/view/landing/get_started_screen.dart';
import 'package:spendify/view/landing/splash_screen.dart';
import 'package:spendify/view/profile/profile_screen.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.GETSTARTED,
      page: () => const GetStartedScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => const ResetPasswordScreen(),
      transition: Transition.fadeIn,
    ),
  ];
}
