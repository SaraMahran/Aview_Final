import 'package:aview2/view_models/providers/review_provider.dart';
import 'package:aview2/view_models/providers/reviewer_provider.dart';
import 'package:aview2/view_models/providers/slider_provider.dart';
import 'package:aview2/views/home_cycle/drawer_screens/setting_screen.dart';
import 'package:aview2/views/home_cycle/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view_models/providers/home_provider.dart';
import 'utils/router.dart' as route;
import 'utils/routing_constants.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    Firebase.initializeApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SliderProvider()),
        ChangeNotifierProvider(create: (_) => ReviewProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => SettingProvider()),
        ChangeNotifierProvider(create: (_) => ReviewerProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          // primarySwatch: Colors.orange,
          accentColor: Colors.green,
          backgroundColor: Colors.yellow,
          primaryColor: Colors.white,
          textTheme: TextTheme(
            headline1: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.orange),
            headline2: TextStyle(
                fontSize: 16, fontStyle: FontStyle.italic, color: Colors.black),
            bodyText2: TextStyle(
                fontSize: 14.0, fontFamily: 'Hind', color: Colors.black),
          ),
        ),
        debugShowCheckedModeBanner: false,
        title: 'Aview',
        onGenerateRoute: route.generateRoute,
        initialRoute: SplashScreenRoute,
      ),
    );
  }
}
