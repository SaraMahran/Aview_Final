import 'package:aview2/view_models/providers/slider_provider.dart';
import 'package:aview2/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/router.dart' as route;
import 'views/routing_constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SliderProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NamedRouting',
        home: SplashScreen(),
        onGenerateRoute: route.generateRoute,
        initialRoute: SplashScreenRoute,
      ),
    );
  }
}
