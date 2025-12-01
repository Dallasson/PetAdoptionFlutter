

import 'package:get/get.dart';
import 'package:pet/views/home_screen.dart';
import 'package:pet/views/intro_screen.dart';
import 'package:pet/views/login_screen.dart';
import 'package:pet/views/recover_screen.dart';
import 'package:pet/views/register_screen.dart';
import 'package:pet/views/splash_screen.dart';

class AppRouter {

  static final String splashScreen = "/splash";
  static final String introScreen = "/intro";
  static final String loginScreen = "/login";
  static final String registerScreen = "/register";
  static final String recoverScreen = "/recover";
  static final String homeScreen = "/home";

  static final List<GetPage> pages = [
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: introScreen, page: () => const IntroScreen()),
    GetPage(name: loginScreen, page: () => const LoginScreen()),
    GetPage(name: registerScreen, page: () => const RegisterScreen()),
    GetPage(name: recoverScreen, page: () => RecoverScreen()),
    GetPage(name: homeScreen, page: () => HomeScreen())
  ];

}