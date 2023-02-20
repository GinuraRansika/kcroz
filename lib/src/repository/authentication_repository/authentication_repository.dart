import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:kcroz/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:kcroz/src/home_page.dart';
import 'package:kcroz/src/repository/authentication_repository/exceptions/signup_email_password_failure.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  // Variables
  final _auth = FirebaseAuth.instance; // for the firebase authentication
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 6));
    firebaseUser = Rx<User?>(_auth.currentUser); // casting
    firebaseUser.bindStream(_auth.userChanges()); // always listening to the user

    // whenever anything came new below function should be called
    ever(firebaseUser, _setInitialScreen);
  } // ? - it can be nullable



  _setInitialScreen(User? user) {
    // Get.offAll - remove all the previous screen if the user logged out
    user == null ? Get.offAll(() => const WelcomeScreen()) : Get.offAll(() => () => const HomePage());
  }

  Future<void> createUserWithEmailAndPassword(String email, String password) async {
    // cloud statements could throw an exception
    try
    {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null ? Get.offAll(() => const HomePage()) : Get.to(() => const WelcomeScreen());
    }
    on FirebaseAuthException catch(e)
    {
      final exception = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${exception.message}');
      throw exception;
    }
    catch (_)
    {
      const exception = SignUpWithEmailAndPasswordFailure();
      print('FIREBASE AUTH EXCEPTION - ${exception.message}');
      throw exception;
    }
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    // cloud statements could throw an exception
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e){
    } catch (_) {}
  }

  Future<void> logout() async { await _auth.signOut();}
}