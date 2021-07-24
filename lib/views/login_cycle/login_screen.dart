import 'package:aview2/components/widgets/custom_appBar.dart';
import 'package:aview2/components/widgets/custom_shape_login_header.dart';
import 'package:aview2/components/widgets/login_and_signup_header.dart';
import 'package:aview2/components/widgets/buttons/login_button.dart';
import 'package:aview2/components/widgets/textFormField.dart';
import 'package:aview2/services/firebase_auth_service.dart';
import 'package:aview2/utils/routing_constants.dart';
import 'package:aview2/view_models/providers/google_sign_in_provider.dart';
import 'package:aview2/view_models/providers/reviewer_provider.dart';
import 'package:aview2/views/home_cycle/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:http/http.dart' as http;
import 'package:aview2/utils/string_validation.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  bool checkBoxValue = false;
  double? _height;
  double? _width;
  double? _pixelRatio;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;

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
                      top: _height! / 16.0),
                  child: Form(
                    key: globalKey,
                    child: Column(
                      children: <Widget>[
                        CustomTextField(
                          keyboardType: TextInputType.emailAddress,
                          icon: Icons.email,
                          hint: "Email ",
                          validator: (input) {
                            if (input!.isEmpty) {
                              return 'Email is required';
                            } else if (input.isNotValidEmail()) {
                              return 'Invalid Email';
                            }
                          },
                          textEditingController: emailController,
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
                          validator: (input) {
                            if (input!.isEmpty) {
                              return 'Password is required';
                              //print("Password is required");
                            } else if (input.length < 8) {
                              // print("Password must be longer than 8 characters");
                              return "Password must be longer than 8 characters";
                              // } else if (input.isNotValidPassword()) {
                              //   //print('Invalid Password');
                              //   return 'Invalid Password';
                              // }
                            }
                          },
                          hint: "Password",
                          textEditingController: passwordController,
                          onClick: (value) {
                            passwordController = value;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Builder(
                  builder: (context) => LoginButton(
                    buttonTitle: 'Login',
                    onTap: () async {
                      if (globalKey.currentState!.validate()) {
                        globalKey.currentState!.save();
                        final firebaseAuthService = FirebaseAuthService(
                          firebaseAuth: FirebaseAuth.instance,
                        );

                        await firebaseAuthService.SignIn(
                            email: emailController.text,
                            password: passwordController.text);
                        // await Provider.of<ReviewerProvider>(context,
                        //         listen: false)
                        //     .retrieveUserData('ydFcfRjjsocfMZCfgoQg');
                        Navigator.pushNamed(context, HomeScreenRoute);
                      }
                    },
                  ),
                ),
                SizedBox(height: 8),
                LoginButton(
                    buttonTitle: 'Sign Up',
                    onTap: () async {
                      Navigator.pushNamed(context, SignUpScreenRoute);
                      //   await Provider.of<GoogleSignInProvider>(context,
                      //           listen: false)
                      //       .googleSignOut();
                      //   Fluttertoast.showToast(msg: 'sign out done');
                    }),
                LoginButton(
                  buttonTitle: 'Login Anonymously',
                  onTap: () async {
                    dynamic result = await auth.signInAnonymously();
                    if (result == null) {
                      print('Error signing in');
                    } else {
                      print('Signed in');
                      print(result);
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Login using social media",
                    style: TextStyle(
                        fontFamily: 'Crimson',
                        fontWeight: FontWeight.w800,
                        color: Colors.deepPurple[500],
                        fontSize: 20),
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    GestureDetector(
                        onTap: () async {
                          try {
                            //GoogleSignInAccount? _user;
                            final googleSignIn = GoogleSignIn();
                            final googleUser = await googleSignIn.signIn();
                            if (googleUser != null) {
                              final googleAuth =
                                  await googleUser.authentication;
                              if (googleAuth.idToken != null) {
                                await FirebaseAuth.instance
                                    .signInWithCredential(
                                        GoogleAuthProvider.credential(
                                            accessToken: googleAuth.accessToken,
                                            idToken: googleAuth.idToken));
                                final user = FirebaseAuth.instance.currentUser;
                                print(user);
                                print("Done");
                              }
                            }
                          } catch (e) {
                            print(e.toString());
                          }
                        },
                        child: Image.asset('assets/images/google_logo.png')),
                    SizedBox(width: 30),
                    GestureDetector(
                      onTap: () async {
                        final fb = FacebookLogin();

// Log in
                        final res = await fb.logIn(permissions: [
                          FacebookPermission.publicProfile,
                          FacebookPermission.email,
                        ]);

// Check result status
                        switch (res.status) {
                          case FacebookLoginStatus.success:
                            // Logged in

                            // Send access token to server for validation and auth
                            final FacebookAccessToken? accessToken =
                                res.accessToken;
                            print('Access token: ${accessToken!.token}');
                            final profile = await fb.getUserProfile();

                            print(profile);
                            setState(() {
                              //var name = profile['first_name'];
                              //var image = profile['picture']['data']['url'];
                            });
                            print('''
         Logged in!
         
         Token: ${accessToken.token}
         User id: ${accessToken.userId}
         Expires: ${accessToken.expires}
         Permissions: ${accessToken.permissions}
         Declined permissions: ${accessToken.declinedPermissions}
         ''');
                            break;
                            // final graphResponse = await http.get

                            //   ('https://graph.facebook.com/v2.12/me?fields=name,picture.width(800).height(800),first_name,last_name,email&access_token=${accessToken.token}')
                            //final graphResponse = await http.get(
                            //  'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${accessToken.token}');
                            //final profile = JsonDecoder(graphResponse.body);

                            // Get profile data
                            // final profile = await fb.getUserProfile();

                            // Get user profile image url
                            final imageUrl =
                                await fb.getProfileImageUrl(width: 100);
                            print('Your profile image: $imageUrl');

                            // Get email (since we request email permission)
                            final email = await fb.getUserEmail();
                            // But user can decline permission
                            if (email != null)
                              print('And your email is $email');

                            break;
                          case FacebookLoginStatus.cancel:
                            // User cancel log in
                            break;
                          case FacebookLoginStatus.error:
                            // Log in failed
                            print('Error while log in: ${res.error}');
                            break;
                        }
                      },
                      child: Image.asset('assets/images/facebook_logo.png'),
                    ),
                    SizedBox(width: 30),
                    GestureDetector(
                        onTap: () async {
                          Navigator.pushNamed(
                              context, PhoneAuthenticationScreenRoute);
                        },
                        child: Image.asset('assets/images/phone_logo.png')),
                  ],
                ),
                TextButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, SignUpPlaceOwnerRoute),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Are you a place owner?',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(fontFamily: 'Crimson', fontSize: 20),
                      children: [
                        TextSpan(
                          text: ' Sign Up!',
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(fontFamily: 'ChelaOne', fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}