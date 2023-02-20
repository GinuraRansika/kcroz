import 'package:get/get.dart';
import 'package:kcroz/src/home_page.dart';
import 'package:kcroz/src/repository/authentication_repository/authentication_repository.dart';

class OTPController extends GetxController{
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    // if it is verified it will go the HomePage Screen
    isVerified ? Get.offAll(const HomePage()) : Get.back();
  }
}