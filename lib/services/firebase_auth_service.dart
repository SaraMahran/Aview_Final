import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  late FirebaseAuth firebaseAuth;

  FirebaseAuthService({required this.firebaseAuth});
  //Stream<String> get onAuthStateChanges => firebaseAuth.authStateChanges();
  Future<void> SignOut() async {
    await firebaseAuth.signOut();
  }

  Future<String?> SignIn(
      {required String email, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed In Successfully ";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> SignUp({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        print('userName = ${value.additionalUserInfo!.username.toString()}');
      });
      return 'Signed Up Successfully';
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    }
  }
}
