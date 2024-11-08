import 'package:car_app/presentation/views/auth/login_view.dart';
import 'package:car_app/presentation/views/utils/onboarding/get_started_screen.dart';
import 'package:car_app/presentation/views/utils/onboarding/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import '../../core/utils/navigation_helper.dart';
import '../../presentation/views/errors/error_view.dart';
import '../../presentation/views/main_screen.dart';
import '../../presentation/views/utils/splash_screen.dart';

class AppRoutes {
  static const String main = '/';
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String getstarted = '/getstarted';
  static const String login = '/login';

  






  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case main:
        return NavigationHelper.createSlideRoute(const MainScreen());
     
      case splash:
        return NavigationHelper.createSlideRoute( const Splashscreen());
  
      
       case onboarding:
       return NavigationHelper.createSlideRoute(const OnBoardingScreen());

       case getstarted:
       return NavigationHelper.createSlideRoute(const GetStartedScreen());

case login:
       return NavigationHelper.createSlideRoute(const SignInPage());

      
      default:
        return NavigationHelper.createSlideRoute(const ErrorView());
    }
  }
}
