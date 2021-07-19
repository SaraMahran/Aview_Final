import 'package:aview2/services/firebase_auth_service.dart';
import 'package:aview2/view_models/providers/google_sign_in_provider.dart';
import 'package:aview2/view_models/providers/review_provider.dart';
import 'package:aview2/view_models/providers/reviewer_provider.dart';
import 'package:aview2/view_models/providers/sign_up_provider.dart';
import 'package:aview2/view_models/providers/slider_provider.dart';
import 'package:aview2/views/home_cycle/category/category_screen.dart';
import 'package:aview2/views/home_cycle/drawer_screens/setting_screen.dart';
import 'package:aview2/views/home_cycle/home_screen.dart';
import 'package:aview2/views/login_cycle/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view_models/providers/home_provider.dart';
import 'utils/router.dart' as route;
import 'utils/routing_constants.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SliderProvider()),
        ChangeNotifierProvider(create: (_) => ReviewProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => SettingProvider()),
        ChangeNotifierProvider(create: (_) => SignUpProvider()),
        ChangeNotifierProvider(create: (_) => ReviewerProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => GoogleSignInProvider()),
        Provider<FirebaseAuthService>(
          create: (_) =>
              FirebaseAuthService(firebaseAuth: FirebaseAuth.instance),
          // StreamProvider(create: (context) =>context.read<FirebaseAuthService>().authStateChanges ,
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          // primarySwatch: Colors.orange,
          accentColor: Colors.deepOrange,
          backgroundColor: Colors.yellow,
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          textTheme: TextTheme(
            headline1: TextStyle(
              fontFamily: 'ChelaOne',
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange,
            ),
            headline3: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            headline2: TextStyle(
                fontSize: 25,
                fontFamily: 'ChelaOne',
                //fontStyle: FontStyle.italic,
                color: Colors.purple[900]),
            headline6: TextStyle(
                fontFamily: 'Crimson',
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.white),
            bodyText2: TextStyle(
                fontSize: 14.0,
                fontFamily: 'Hind',
                color: Color.fromARGB(255, 245, 212, 202)),
            headline4: TextStyle(
              fontSize: 14.0,
              fontFamily: 'Hind',
              color: Colors.grey,
            ),
            headline5: TextStyle(
                fontSize: 25,
                fontFamily: 'ChelaOne',
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
        debugShowCheckedModeBanner: false,
        title: 'Aview',
        onGenerateRoute: route.generateRoute,
        initialRoute: SplashScreenRoute,
        home: AuthenticaionWrapper(),
      ),
    );
  }
}

class AuthenticaionWrapper extends StatelessWidget {
  @override
  const AuthenticaionWrapper({
    Key? key,
  }) : super(key: key);

  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    if (firebaseUser != null) {
      return HomeScreen();
    } else {
      return LoginScreen();
    }
  }
}
