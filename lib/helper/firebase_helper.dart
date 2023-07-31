import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_sign_in/google_sign_in.dart';

final firebaseInstance = FirebaseDatabase.instance;
final firebaseAuthInstance = FirebaseAuth.instance;
final firebaseAuth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();
GoogleSignInAccount? googleUser;
User? user;

Future<String> handleGoogleSignIn() async {
  try {
    googleUser = await _googleSignIn.signIn();

    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential =
          await firebaseAuth.signInWithCredential(credential);
      user = userCredential.user;
      return "Susccess";
    } else {
      return "Fail";
    }
  } catch (error) {
    return "Fail";
  }
}

Future<String> handleEmailSignIn(String email, String password) async {
  try {
    final UserCredential userCredential =
        await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Login success, you can do additional actions here, such as navigating to the home screen.
    user = userCredential.user;
    print("User Dispay Name : ${user!.displayName}");
    return "Susccess";
  } catch (error) {
    return "Fail";
  }
}

Future<void> handleSignUp(String email, String password) async {
  try {
    final UserCredential userCredential =
        await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    print("Signup Successful! User ID: ${userCredential.user?.uid}");
  } catch (error) {
    print("Error signing up: $error");
  }
}

Future<void> handleSignOut() async {
  try {
    await firebaseAuth.signOut();
  } catch (error) {
    print("Error signing out: $error");
  }
}
