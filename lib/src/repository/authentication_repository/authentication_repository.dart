import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:kcroz/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:kcroz/src/home_page.dart';
import 'package:kcroz/src/repository/authentication_repository/exceptions/login_email_password_failure.dart';
import 'package:kcroz/src/repository/authentication_repository/exceptions/signup_email_password_failure.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  // Variables
  final _auth = FirebaseAuth.instance; // for the firebase authentication
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;  // this will observe and automatically update it's children if a change happens

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser); // casting
    firebaseUser.bindStream(_auth.userChanges()); // always listening to the user
    // whenever anything came new below function should be called
    ever(firebaseUser, _setInitialScreen);
  } // ? - it can be nullable

  _setInitialScreen(User? user) {
    // Get.offAll - remove all the previous screen if the user logged out
    user == null ? Get.offAll(() => const WelcomeScreen()) : Get.offAll(() => () => const HomePage());
  }


  Future<void> phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        codeSent: (String verificationId,int? resendToken) {
          this.verificationId.value = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) {
          this.verificationId.value = verificationId;
        },
        verificationFailed: (e) {
          if(e.code == 'invalid-phone-number'){
            Get.snackbar("Error", "The provided phone number is not valid.");
          } else{
            print(e);
            Get.snackbar("Error", "Something went wrong. Try again.");
          }
      },
    );
  }
  
  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(PhoneAuthProvider.credential(verificationId: verificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }

  Future<String?> createUserWithEmailAndPassword(String email, String password) async {
    // cloud statements could throw an exception
    try
    {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null ? Get.offAll(() => const HomePage()) : Get.to(() => const WelcomeScreen());
    }
    on FirebaseAuthException catch(e)
    {
      final exception = SignUpWithEmailAndPasswordFailure.code(e.code);
      return exception.message;
    }
    catch (_)
    {
      const exception = SignUpWithEmailAndPasswordFailure();
      return exception.message;
    }
    return null;
  }

  Future<String?> loginWithEmailAndPassword(String email, String password) async {
    // cloud statements could throw an exception
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e){
      final exception = LoginWithEmailAndPasswordFailure.code(e.code);
      return exception.message;
    } catch (_) {
      const exception = LoginWithEmailAndPasswordFailure();
      return exception.message;
    }
    return null;
  }

  Future<void> logout() async { await _auth.signOut();}
}