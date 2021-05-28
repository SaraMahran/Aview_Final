import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:aview2/helper/helper_method.dart';
import 'package:aview2/helper/helper_style.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordVisible = true;
  //final databaseReference = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Image.asset(
                    'assets/images/Aview_Final_Logo_Cropped.png',
                    scale: 1.7,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .02,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration:
                      kUnderlineDecorationTF.copyWith(hintText: 'Email'),
                ),
                TextField(
                  obscureText: isPasswordVisible,
                  decoration: kUnderlineDecorationTF.copyWith(
                    hintText: 'Password',
                    suffixIcon: IconButton(
                      icon: isPasswordVisible
                          ? Icon(Icons.visibility_off, color: kOrangeColor)
                          : Icon(Icons.visibility, color: kOrangeColor),
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  // onTap: () {
                  //   kShowSnackBar(context, 'Login Pressed');
                  //   Navigator.pushNamed(context, );
                  // },
                  child: Container(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ),
                    ),
                    width: kWidth(context) * .8,
                    decoration: BoxDecoration(
                      color: kOrangeColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    kShowSnackBar(context, 'Forget Password Pressed');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Forget Password',
                      style: TextStyle(color: kOrangeColor, fontSize: 20),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Or Login With',
                    style: TextStyle(color: kOrangeColor, fontSize: 20),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        kShowSnackBar(context, 'google pressed');
                      },
                      child: Image.asset('assets/images/google_logo.png'),
                    ),
                    GestureDetector(
                      onTap: () {
                        kShowSnackBar(context, 'facebook pressed');
                      },
                      child: Image.asset('assets/images/facebook_logo.png'),
                    ),
                    GestureDetector(
                      onTap: () {
                        kShowSnackBar(context, 'phone pressed');
                      },
                      child: Image.asset('assets/images/phone_logo.png'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
