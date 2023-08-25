import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/view/dashboard.dart';
import 'package:flutter_app/view/login.dart';
import 'package:flutter_app/view/user_profile.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user = Rx<User?>(null);
  FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  get user => _user;
  bool get isLoggedIn => _user.value != null && auth.currentUser != null;

  @override
  void onReady() {
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => MyHomePage());
    } else {
      Get.offAll(() => UserProfile());
    }
  }

  void register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar("About User", "User message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Account Creation failed",
            style: TextStyle(color: Colors.white),
          ),
          messageText: Text(
            e.toString(),
            style: TextStyle(color: Colors.white),
          ));
    }
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar("About Login", "Login message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Login failed",
            style: TextStyle(color: Colors.white),
          ),
          messageText: Text(
            e.toString(),
            style: TextStyle(color: Colors.white),
          ));
    }
  }

  void signout() async {
    await auth.signOut();
  }

  signInWithGoogle() async {
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
