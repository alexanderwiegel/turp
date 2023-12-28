import 'package:firebase_auth/firebase_auth.dart';
import 'package:turp/constants.dart';
import 'package:turp/model/turp_user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TurpUser _userFromFirebaseUser(User? user) {
    return TurpUser(uid: user!.uid);
  }

  Stream<TurpUser> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      printInfo("About to create a user with the email $email");
      final UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final User? user = result.user;
      printSuccess("User: $user");
      // await user!.sendEmailVerification();
      return _userFromFirebaseUser(user);
    } catch (e) {
      printError(e.toString());
      return null;
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      printInfo("About to sign-in a user.");
      final UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      final User? user = result.user;
      printSuccess("User: $user");
      return _userFromFirebaseUser(user);
    } catch (e) {
      printError(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      printError(e.toString());
      return null;
    }
  }
}
