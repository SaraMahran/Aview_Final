import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 2),
              child: Image.asset(
                'assets/images/about_us_2.png',
                scale: 2,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(20)),
            //height: 50,
            //width: 50,
            alignment: Alignment.center,

            child: Column(
              children: [
                Text(
                  ' In the digital era, we are living in; people use social media to search for reviews before making the tiniest purchasing decisions.',
                  style: TextStyle(
                    fontFamily: 'Crimson',
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'This created an urge for a platform that offers reviews on various types of places and businesses.',
                  style: TextStyle(
                    fontFamily: 'Crimson',
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
