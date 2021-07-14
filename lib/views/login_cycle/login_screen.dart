import 'package:aview2/components/widgets/custom_appBar.dart';
import 'package:aview2/components/widgets/custom_shape_login_header.dart';
import 'package:aview2/components/widgets/login_and_signup_header.dart';
import 'package:aview2/components/widgets/buttons/login_button.dart';
import 'package:aview2/components/widgets/social_media_row.dart';
import 'package:aview2/components/widgets/textFormField.dart';
import 'package:aview2/services/firebase_auth_service.dart';
import 'package:aview2/utils/routing_constants.dart';
import 'package:aview2/view_models/providers/reviewer_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:aview2/components/widgets/responsive_ui.dart';
import 'package:provider/provider.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool checkBoxValue = false;
  double? _height;
  double? _width;
  double? _pixelRatio;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordControl = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    return Material(
      child: Scaffold(
        body: Container(
          height: _height,
          width: _width,
          margin: EdgeInsets.only(bottom: 5),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Opacity(
                    opacity: 0.88,
                    child: CustomAppBar(
                      haveArrowButton: false,
                    )),
                LoginAndSignUpHeader(),
                Container(
                  margin: EdgeInsets.only(
                      left: _width! / 12.0,
                      right: _width! / 12.0,
                      top: _height! / 10.0),
                  child: Form(
                    child: Column(
                      children: <Widget>[
                        CustomTextField(
                          keyboardType: TextInputType.emailAddress,
                          icon: Icons.email,
                          hint: "Email ",
                          textEditingController: emailController,
                        ),
                        // SizedBox(height: _height! / 60.0),
                        // phoneTextFormField(),
                        SizedBox(height: _height! / 60.0),
                        CustomTextField(
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          icon: Icons.lock,
                          hint: "Password",
                          textEditingController: passwordControl,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                LoginButton(
                    buttonTitle: 'Login',
                    onTap: () async {
                      Navigator.pushNamed(context, HomeScreenRoute);
                      final firebaseAuthService = FirebaseAuthService(
                        firebaseAuth: FirebaseAuth.instance,
                      );
                      await firebaseAuthService.SignUp(
                        email: emailController.text,
                        password: passwordControl.text,
                      );
                      // await Provider.of<ReviewerProvider>(context,
                      //         listen: false)
                      //     .retriveUserData('ydFcfRjjsocfMZCfgoQg');
                    }),
                SizedBox(
                  height: _height! / 35,
                ),
                LoginButton(
                  buttonTitle: 'SignUp',
                  onTap: () => Navigator.pushNamed(context, SignUpScreenRoute),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Login using social media",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.deepPurple[500]),
                  ),
                ),
                SocialMediaIconsRow(), //signInTextRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
