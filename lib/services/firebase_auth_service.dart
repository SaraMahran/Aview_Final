import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  late FirebaseAuth firebaseAuth;

  FirebaseAuthService({required this.firebaseAuth});

  Stream<User?> get onAuthStateChanges => firebaseAuth.authStateChanges();

  Future<void> SignOut() async {
    await firebaseAuth.signOut();
  }

  Future<String?> SignIn(
      {required String email, required String password}) async {
    try {
      await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then(
            (value) => print('userEmail = ${value.user!.email}'),
          );
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

  Future<void> sendPasswordResetEmail(String email) async {
    return firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
