import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  GoogleSignInAccount? _user;
  final googleSignIn = GoogleSignIn();
  Future<void> googleLogin() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    print(credential);
    await FirebaseAuth.instance.signInWithCredential(credential);
    notifyListeners();
  }

  Future<void> googleLogin() async {
    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    final googleSignInAuth = await googleSignInAccount!.authentication;
    final authCredential = GoogleAuthProvider.credential(
      idToken: googleSignInAuth.idToken,
      accessToken: googleSignInAuth.accessToken,
    );
    final authResult = await _auth.signInWithCredential(authCredential);
    final user = authResult.user;
    print('user >> ${user!.email}');
    final user2 = authResult.additionalUserInfo;
  }

  Future<void> googleSignOut() async {
    await _googleSignIn.signOut();
  }
}
