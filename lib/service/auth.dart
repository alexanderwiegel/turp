import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:turp/constants.dart';
import 'package:turp/model/turp_user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseDatabase database = FirebaseDatabase.instance;

  TurpUser setUserID(User? user) {
    printInfo("Setting the user id to ${user!.uid}");
    TurpUser.uid = user.uid;
    return TurpUser();
  }

  Stream<TurpUser> get user {
    return _auth.authStateChanges().map(setUserID);
  }

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      printInfo("About to create a user with the email $email");
      final UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final User? user = result.user;
      printSuccess("User: $user");
      // await user!.sendEmailVerification();
      return setUserID(user);
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
      return setUserID(user);
    } catch (e) {
      printError(e.toString());
      return null;
    }
  }

  Future updateUser(user) async {
    printInfo(
        "Getting a reference to the database to update the user with user id ${TurpUser.uid}");
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("users/${TurpUser.uid}");
    try {
      printInfo("Trying to update the following data: $user");
      await ref.set(user);
      printSuccess("Successfully updated the user data");
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
