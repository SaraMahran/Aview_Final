import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.deepOrange, //change your color here
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        shadowColor: Colors.transparent,
        title: Text(
          'About Us',
          style: TextStyle(
            fontSize: 20,
            color: Colors.deepOrange,
          ),
        ),
      ),
      body: Center(
        child: Image.asset(
          'assets/images/about_us_2.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
