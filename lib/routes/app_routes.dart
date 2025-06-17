// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const HOME = _Paths.HOME;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const SPLASH = _Paths.SPLASH;
  static const GETSTARTED = _Paths.GETSTARTED;
  static const PROFILE = _Paths.PROFILE;
  static const FORGOT_PASSWORD = _Paths.FORGOT_PASSWORD;
  static const RESET_PASSWORD = _Paths.RESET_PASSWORD;
}

abstract class _Paths {
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const SPLASH = '/splash';
  static const GETSTARTED = '/getStarted';
  static const PROFILE = '/profile';
  static const FORGOT_PASSWORD = '/forgotPassword';
  static const RESET_PASSWORD = '/resetPassword';
}
