import 'package:aview2/view_models/providers/review_provider.dart';
import 'package:aview2/view_models/providers/slider_provider.dart';
import 'package:aview2/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/router.dart' as route;
import 'views/routing_constants.dart';
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
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.orange,
          accentColor: Colors.green,
          backgroundColor: Colors.yellow,
          primaryColor: Colors.deepOrange,
        ),
        debugShowCheckedModeBanner: false,
        title: 'Aview',
        onGenerateRoute: route.generateRoute,
        initialRoute: SplashScreenRoute,
      ),
    );
  }
}
