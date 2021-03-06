import 'package:aview2/utils/routing_constants.dart';
import 'package:aview2/views/home_cycle/category/place_screen.dart';
import 'package:aview2/views/home_cycle/category/category_screen.dart';
import 'package:aview2/views/home_cycle/category/category_screen.dart';
import 'package:aview2/views/home_cycle/drawer_screens/about_us_screen.dart';
import 'package:aview2/views/home_cycle/drawer_screens/chat_screen.dart';
import 'package:aview2/views/home_cycle/drawer_screens/email_screen.dart';
import 'package:aview2/views/home_cycle/drawer_screens/fqa_screen.dart';
import 'package:aview2/views/home_cycle/drawer_screens/help_screen.dart';
import 'package:aview2/views/home_cycle/drawer_screens/setting_screen.dart';
import 'package:aview2/views/home_cycle/edit_profile.dart';
import 'package:aview2/views/home_cycle/map/map_screen.dart';
import 'package:aview2/views/home_cycle/category/new_places_screen.dart';
import 'package:aview2/views/home_cycle/profile_screen.dart';
import 'package:aview2/views/home_cycle/category/trending_places_screen.dart';
import 'package:aview2/views/login_cycle/otp_screen.dart';
import 'package:aview2/views/login_cycle/phone_authentication_screen.dart';
import 'package:aview2/views/login_cycle/sign_up_place_owner_screen.dart';
import 'package:aview2/views/login_cycle/sign_up_screen.dart';
import 'package:aview2/views/splash_cycle/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../views/login_cycle/login_screen.dart';
import 'routing_constants.dart';
import '../views/splash_cycle/splash_screen.dart';
import '../views/splash_cycle/slider_screen.dart';
import '../views/home_cycle/home_screen.dart';
import '../views/home_cycle/category/category_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreenRoute:
      return MaterialPageRoute(builder: (context) => SplashScreen());
    case SliderScreenRoute:
      return MaterialPageRoute(builder: (context) => SliderScreen());
    case SignUpPlaceOwnerRoute:
      return MaterialPageRoute(builder: (context) => SignUpPlaceOwnerScreen());
    case SignUpScreenRoute:
      return MaterialPageRoute(builder: (context) => SignUpScreen());
    case LoginScreenRoute:
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case PhoneAuthenticationScreenRoute:
      return MaterialPageRoute(
          builder: (context) => PhoneAuthenticationScreen());
    case OTPScreenRoute:
      return MaterialPageRoute(
        builder: (context) => OTPScreen(
          phone: '',
        ),
      );
    case MapsScreenRoute:
      return MaterialPageRoute(builder: (context) => MapsScreen());
    case ChatScreenRoute:
      return MaterialPageRoute(builder: (context) => ChatScreen());
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
    case ProfileScreenRoute:
      return MaterialPageRoute(builder: (context) => ProfileScreen());
    case PlaceScreenRoute:
      return MaterialPageRoute(builder: (context) => PlaceScreen());
    case EditProfileScreenRoute:
      return MaterialPageRoute(builder: (context) => EditProfileScreen());
    case EmailScreenRoute:
      return MaterialPageRoute(builder: (context) => EmailScreen());

    case AboutUsScreenRoute:
      return MaterialPageRoute(builder: (context) => AboutUsScreen());
    case FqaScreenRoute:
      return MaterialPageRoute(builder: (context) => FqaScreen());
    case HelpScreenRoute:
      return MaterialPageRoute(builder: (context) => HelpScreen());

    default:
      return MaterialPageRoute(builder: (context) => SplashScreen());
  }
}
