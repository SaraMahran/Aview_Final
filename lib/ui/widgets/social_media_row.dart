import 'package:flutter/material.dart';

class SocialMediaIconsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(top: _height / 80.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset('assets/images/google_logo.png'),
          SizedBox(
            width: 30,
          ),
          Image.asset('assets/images/facebook_logo.png'),
          SizedBox(
            width: 30,
          ),
          Image.asset('assets/images/phone_logo.png')
          // CircleAvatar(
          //   backgroundColor: Colors.white,
          //   radius: 15,
          //   backgroundImage: AssetImage("assets/images/google_logo.png"),
          // ),
          // SizedBox(
          //   width: 20,
          // ),
          // CircleAvatar(
          //   backgroundColor: Colors.white,
          //   radius: 15,
          //   backgroundImage: AssetImage("assets/images/facebook_logo.png"),
          // ),
          // SizedBox(
          //   width: 20,
          // ),
          // CircleAvatar(
          //   backgroundColor: Colors.white,
          //   radius: 15,
          //   backgroundImage: AssetImage("assets/images/phone_logo.png"),
          // ),
        ],
      ),
    );
  }
}
