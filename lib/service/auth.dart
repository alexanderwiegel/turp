import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:turp/constants.dart';
import 'package:turp/model/turp_user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;

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
      // printSuccess("User: $user");
      return setUserID(user);
    } catch (e) {
      printError(e.toString());
      return null;
    }
  }

  Future addOrUpdateUser(TurpUser user) async {
    try {
      printInfo("Trying to add or update a user.");
      final userRef = db.collection("users").doc(TurpUser.uid).withConverter(
            fromFirestore: TurpUser.fromFirestore,
            toFirestore: (TurpUser turpUser, options) => turpUser.toFirestore(),
          );
      await userRef.set(user);
      printSuccess("Successfully updated the user data");
    } catch (e) {
      printError(e.toString());
      return null;
    }
  }

  Future getUser() async {
    try {
      printInfo("Trying to get user with uid ${TurpUser.uid}.");
      final userRef = db.collection("users").doc(TurpUser.uid).withConverter(
            fromFirestore: TurpUser.fromFirestore,
            toFirestore: (TurpUser turpUser, options) => turpUser.toFirestore(),
          );
      final userSnap = await userRef.get();
      final turpUser = userSnap.data(); // Convert to TurpUser
      if (turpUser != null) {
        printSuccess("Successfully got user with uid ${TurpUser.uid}.");
        return turpUser;
      } else {
        printError("No data found for given user.");
        return null;
      }
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
