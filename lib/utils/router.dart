import 'package:aview2/utils/routing_constants.dart';
import 'package:aview2/views/home_cycle/category_screen.dart';
import 'package:aview2/views/home_cycle/drawer_screens/setting_screen.dart';
import 'package:aview2/views/home_cycle/new_places_screen.dart';
import 'package:aview2/views/home_cycle/trending_places_screen.dart';
import 'package:aview2/views/login_cycle/sign_up_screen.dart';
import 'package:aview2/views/splash_cycle/splash_screen.dart';
import 'package:flutter/material.dart';
import '../views/login_cycle/login_screen.dart';
import 'routing_constants.dart';
import '../views/splash_cycle/splash_screen.dart';
import '../views/splash_cycle/slider_screen.dart';
import '../views/home_cycle/home_screen.dart';
import '../views/home_cycle/category_screen.dart';

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
    case CategoryScreenRoute:
      return MaterialPageRoute(builder: (context) => CategoryScreen());
    case NewPlacesScreenRoute:
      return MaterialPageRoute(builder: (context) => NewPlacesScreen());
    case TrendingPlacesScreenRoute:
      return MaterialPageRoute(builder: (context) => TrendingPlacesScreen());
    case SettingsScreenRoute:
      return MaterialPageRoute(builder: (context) => SettingsScreen());

    default:
      return MaterialPageRoute(builder: (context) => SplashScreen());
  }
}
