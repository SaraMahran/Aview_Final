import 'package:aview2/views/routing_constants.dart';
import 'package:aview2/views/sign_up_screen.dart';
import 'package:aview2/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'routing_constants.dart';
import 'splash_screen.dart';
import 'slider_screen.dart';
import 'home_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreenRoute:
      return MaterialPageRoute(builder: (context) => SplashScreen());
    case SliderScreenRoute:
      return MaterialPageRoute(builder: (context) => SliderScreen());
    case SignUpScreenRoute:
      return MaterialPageRoute(builder: (context) => SignUpScreen());
    case LoginScreenRoute:
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case HomeScreenRoute:
      return MaterialPageRoute(builder: (context) => HomeScreen());
    case HomeDetailsScreenRoute:
      return MaterialPageRoute(builder: (context) => CategoryScreen());

    default:
      return MaterialPageRoute(builder: (context) => SplashScreen());
  }
}
