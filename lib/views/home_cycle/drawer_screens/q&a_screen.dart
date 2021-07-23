import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QASCreen extends StatelessWidget {
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
          'Questions and Answers',
          style: TextStyle(
            fontSize: 20,
            color: Colors.deepOrange,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Image.asset(
              'assets/images/qa.png',
              scale: 10,
            ),
            Text(
              'To change your password, go to profile, edit profile, then choose change password. You will be directed to enter your email, password and new password.',
              style: TextStyle(
                color: Colors.deepOrange,
              ),
            )
          ],
        ),
      ),
    );
  }
}
