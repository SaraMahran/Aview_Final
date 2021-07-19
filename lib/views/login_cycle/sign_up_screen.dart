import 'package:aview2/components/widgets/buttons/sign_up_button.dart';
import 'package:aview2/components/widgets/custom_appBar.dart';
import 'package:aview2/components/widgets/custom_shape_login_header.dart';
import 'package:aview2/components/widgets/login_and_signup_header.dart';
import 'package:aview2/components/widgets/buttons/login_button.dart';
import 'package:aview2/components/widgets/textFormField.dart';
import 'package:aview2/services/firebase_auth_service.dart';
import 'package:aview2/utils/routing_constants.dart';
import 'package:aview2/utils/string_validation.dart';
import 'package:aview2/view_models/providers/sign_up_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aview2/components/widgets/responsive_ui.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool checkBoxValue = false;
  double? _height;
  double? _width;
  double? _pixelRatio;
  bool? _large;
  bool? _medium;
  String emailErrorMsg = '';

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseAuthService firebaseAuthService =
      FirebaseAuthService(firebaseAuth: FirebaseAuth.instance);

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width!, _pixelRatio!);
    _medium = ResponsiveWidget.isScreenMedium(_width!, _pixelRatio!);

    return Material(
      child: Scaffold(
        body: Container(
          height: _height,
          width: _width,
          margin: EdgeInsets.only(bottom: 5),
          child: SingleChildScrollView(
            child: Form(
              key: globalKey,
              child: Column(
                children: <Widget>[
                  Opacity(
                      opacity: 0.88,
                      child: CustomAppBar(
                        haveArrowButton: true,
                      )),
                  LoginAndSignUpHeader(),
                  Container(
                    margin: EdgeInsets.only(
                        left: _width! / 12.0,
                        right: _width! / 12.0,
                        top: _height! / 20.0),
                    child: Column(
                      children: <Widget>[
                        CustomTextField(
                          keyboardType: TextInputType.text,
                          icon: Icons.person,
                          hint: "First Name",
                          textEditingController: firstNameController,
                          onClick: (value) {
                            firstNameController = value;
                          },
                        ),
                        SizedBox(height: _height! / 60.0),
                        CustomTextField(
                          keyboardType: TextInputType.text,
                          icon: Icons.person,
                          hint: "Last Name",
                          textEditingController: lastNameController,
                          onClick: (value) {
                            lastNameController = value;
                          },
                        ),
                        SizedBox(height: _height! / 60.0),
                        CustomTextField(
                          keyboardType: TextInputType.emailAddress,
                          icon: Icons.email,
                          hint: "Email ",
                          textEditingController: emailController,
                          validator: (input) {
                            if (input!.isNotValidEmail())
                              return 'Invalid Email';

                            return null;
                          },
                          onClick: (value) {
                            emailController = value;
                          },
                        ),
                        // SizedBox(height: _height! / 60.0),
                        // phoneTextFormField(),
                        SizedBox(height: _height! / 60.0),

                        CustomTextField(
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          icon: Icons.lock,
                          hint: "Password",
                          textEditingController: passwordController,
                          onClick: (value) {
                            passwordController = value;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: _height! / 35,
                  ),
                  SignUpButton(
                    buttonTitle: 'SignUp',
                    onTap: () async {
                      if (globalKey.currentState!.validate()) {
                        globalKey.currentState!.save();

                        print(emailController);
                        print(passwordController);
                        try {
                          // final signUpProvider = Provider.of<SignUpProvider>(
                          //   context,
                          //   listen: false,
                          // );
                          // await signUpProvider.addUser(
                          //     firstName: firstNameController.text,
                          //     lastName: lastNameController.text,
                          //     email: emailController.text,
                          //     password: passwordController.text,
                          //     image: "Sara'sImage");
                          Navigator.pushNamed(context, HomeScreenRoute);
                          //final firebaseAuthService = FirebaseAuthService(
                          //   firebaseAuth: FirebaseAuth.instance,
                          //   );
                          await firebaseAuthService.SignUp(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                        } catch (e) {
                          print(e.toString());
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
