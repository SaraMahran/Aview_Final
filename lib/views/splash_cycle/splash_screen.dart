import 'package:aview2/utils/routing_constants.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  void initState() {
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushNamed(context, SliderScreenRoute);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/Aview_Final_Logo_Cropped.png',
              scale: 2.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Reviewer Home',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'ChelaOne',
              color: Colors.deepOrange,
              fontSize: 30,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'Join Us Now',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'ChelaOne',
              color: Colors.deepOrange,
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }
}
