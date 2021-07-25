import 'package:aview2/view_models/providers/sign_up_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class FirebaseAuthService {
  final FirebaseAuth? firebaseAuth;

  FirebaseAuthService({this.firebaseAuth});

  Stream<User?> get onAuthStateChanges => firebaseAuth!.authStateChanges();

  Future<void> SignOut() async {
    await firebaseAuth!.signOut();
  }

  Future<String?> SignIn(
      {required String email, required String password}) async {
    try {
      await firebaseAuth!
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        print('email = ${value.user!.email}');
      });
      return "Signed In Successfully";
    } on FirebaseAuthException catch (e) {
      print('error login ${e.message}');
      return e.message;
    }
  }

  Future<String> SignUp({
    required String email,
    required String password,
    required String lastName,
    required String firstName,
    required String image,
    required BuildContext context,
  }) async {
    final signUpProvider = Provider.of<SignUpProvider>(context, listen: false);
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        signUpProvider.addUser(
          context: context,
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
          image: image,
        );

        print('userName = ${value.additionalUserInfo!.username.toString()}');
      });
      return 'Signed Up Successfully';
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    }
  }

  Future<User?> signInAnon() async {
    try {
      UserCredential result = await firebaseAuth!.signInAnonymously();
      User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    return firebaseAuth!.sendPasswordResetEmail(email: email);
  }
}
