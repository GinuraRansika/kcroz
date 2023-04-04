import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:kcroz/src/features/authentication/screens/screens/welcome/welcome_screen.dart';

import '../features/authentication/screens/screens/login/login_screen.dart';

class AuthenticationRepository {

final _auth = FirebaseAuth.instance;
late final Rx<User?> firebaseUser;
var verificationId = ''.obs;

void onReady(){
  firebaseUser = Rx<User?>(_auth.currentUser);
  firebaseUser.bindStream(_auth.userChanges());
  ever(firebaseUser, _setInitialScreen);
}

_setInitialScreen(User? user){
  user == null ? Get.offAll(() => const WelcomeScreen()) : Get.offAll(() => const LoginScreen());
}

}