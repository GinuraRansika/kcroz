import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kcroz/welcome_page.dart';
import 'login_page.dart';
import 'package:flutter/material.dart';

class AuthController extends GetxController{
  // will make accessible authController and it's props from other pages
  static AuthController instance = Get.find();
  // email, password, name ...
  late Rx<User?> _user;
  // can access props from firebase
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady()
  {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    // track the user (our user would be notified)
    _user.bindStream(auth.userChanges());

    ever(_user, _initialScreen);
  }


  _initialScreen(User? user)
  {
    if(user == null)
      {
        print("login page");
        Get.offAll(() => LoginPage());
      }
    else
      {
        Get.offAll(() => WelcomePage(email:user.email!));
      }
  }

  void register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    }
    catch(e) {
      Get.snackbar("About User", "User message",
      backgroundColor: Colors.redAccent,
      snackPosition: SnackPosition.BOTTOM,
      titleText: const Text(
        "Account creation Failed",
        style: TextStyle (
            color: Colors.white
          ),
      ),
        messageText: Text(
          e.toString(),
          style: const TextStyle(
              color: Colors.white
          ),
        )
      );
    }
  }

  signInWithGoogle() async
  {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
      scopes: <String>["email"]).signIn();
    // obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    }
    catch(e) {
      Get.snackbar("About Login", "Login message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            "Login Failed",
            style: TextStyle (
                color: Colors.white
            ),
          ),
          messageText: Text(
            e.toString(),
            style: const TextStyle(
                color: Colors.white
            ),
          )
      );
    }
  }

  void logout() async {
    await auth.signOut();
  }
}