import 'package:aview2/utils/routing_constants.dart';
import 'package:aview2/views/home_cycle/drawer_screens/q&a_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class FqaScreen extends StatelessWidget {
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
          'FQA',
          style: TextStyle(
            fontSize: 20,
            color: Colors.deepOrange,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 70,
              width: 90,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 70),
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.deepOrangeAccent[100],
                image: DecorationImage(
                    //  alignment: ,
                    image: AssetImage(
                      'assets/images/faq.png',
                    ),
                    scale: 5),
              ),
            ),
            Container(
              // height: 70,
              // width: 90,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 70),
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.deepOrangeAccent[100],
              ),
              child: RichText(
                text: TextSpan(
                  // text: 'How to change your password?',
                  // style: TextStyle(
                  //   fontFamily: 'Crimson',
                  //   fontSize: 20,
                  //   color: Colors.black,
                  // ),
                  children: <TextSpan>[
                    TextSpan(
                        text: '1- How to change your password? ',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            Navigator.pushNamed(context, QAScreenRoute);
                          },
                        style: TextStyle(
                          color: Colors.deepOrange,
                        )),
                    //TextSpan(text: 'text!'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
