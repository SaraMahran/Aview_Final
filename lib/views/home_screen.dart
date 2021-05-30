import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Lottie.asset('assets/lottie/23228-orange-juice.json'),
      ),
    );
  }
}
