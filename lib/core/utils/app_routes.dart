import 'package:car_app/Features/auth/presentation/views/auth/sign_in_view.dart';
import 'package:car_app/Features/auth/presentation/views/auth/sign_up_page.dart';
import 'package:car_app/Features/home/presentation/views/utils/onboarding/get_started_screen.dart';
import 'package:car_app/Features/home/presentation/views/utils/onboarding/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import '../../core/utils/navigation_helper.dart';
import '../../Features/home/presentation/views/errors/error_view.dart';
import '../../Features/home/presentation/views/main_screen.dart';
import '../../Features/home/presentation/views/utils/splash_screen.dart';

class AppRoutes {
  static const String main = '/';
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String getstarted = '/getstarted';
  static const String login = '/login';
  static const String signup = '/signup';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case main:
        return NavigationHelper.createSlideRoute(const MainScreen());

      case splash:
        return NavigationHelper.createSlideRoute(const Splashscreen());

      case onboarding:
        return NavigationHelper.createSlideRoute(const OnBoardingScreen());

      case getstarted:
        return NavigationHelper.createSlideRoute(const GetStartedScreen());

      case login:
        return NavigationHelper.createSlideRoute(const SignInPage());

        case signup:
        return NavigationHelper.createSlideRoute(const SignUpPage());


    
      default:
        return NavigationHelper.createSlideRoute(const ErrorView());
    }
  }
}

