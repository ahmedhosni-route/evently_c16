import 'package:evently_c16_online/core/routes/app_route_name.dart';
import 'package:evently_c16_online/modules/auth/pages/login_screen.dart';
import 'package:evently_c16_online/modules/auth/pages/register_screen.dart';
import 'package:evently_c16_online/modules/layout/pages/layout_screen.dart';
import 'package:evently_c16_online/modules/onboarding/pages/onboarding_screen.dart';
import 'package:evently_c16_online/modules/splash/pages/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteGen{
  static Route<dynamic> generateRoute(RouteSettings settings){
    print("go to => ${settings.name}");
    switch(settings.name){
      case AppRouteName.splash :
        return MaterialPageRoute(builder: (context) {
          return SplashScreen();
        },);
      case AppRouteName.onboarding :
        return PageRouteBuilder(
          transitionDuration: Duration(seconds: 1),
          pageBuilder: (context, animation, secondaryAnimation) {
          return OnboardingScreen();
        },);
      case AppRouteName.login:
        return MaterialPageRoute(builder: (context) {
          return LoginScreen();
        },);   case AppRouteName.createAccount:
        return MaterialPageRoute(builder: (context) {
          return RegisterScreen();
        },);  case AppRouteName.layout:
        return MaterialPageRoute(builder: (context) {
          return LayoutScreen();
        },);

        default:
          return MaterialPageRoute(builder: (context) {
            return Scaffold();
          },);
    }
  }
}