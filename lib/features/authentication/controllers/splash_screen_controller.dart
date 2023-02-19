import 'package:get/get.dart';
import 'package:kcroz/features/authentication/screens/on_boarding/on_boarding_screen.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController get find => Get.find(); // avoid using with instances
  RxBool animate = false.obs;
  
  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 5000));
    Get.to( () => OnBoardingScreen());
  }
}