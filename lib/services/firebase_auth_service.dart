import 'package:firebase_auth/firebase_auth.dart';

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
          .signInWithEmailAndPassword(email: email, password: password);
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
