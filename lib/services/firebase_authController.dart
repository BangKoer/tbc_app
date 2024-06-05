import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');

  Stream<User?> get authStatus => _auth.authStateChanges();

  Future<User?> loginwithEmailandPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      return null;
    }
  }

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        // The user canceled the sign-in
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user != null) {
        await _users.doc(user.uid).set({
          'username': user.displayName,
          'email': user.email,
        });
        return user;
        print('User signed in: ${user.displayName}, ${user.email}');
      }
    } catch (e) {
      print('Error signing in with Google: $e');
      return null;
    }
  }

  Future<User?> registerwithEmailandPassword(
      String email, String password, String username) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (credential.user != null) {
        await _users.doc(credential.user!.uid).set({
          'username': username,
          'email': email,
        });
      }
      return credential.user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  void signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
    print('User signed out');
  }
}
