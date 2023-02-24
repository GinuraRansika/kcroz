import 'package:get/get.dart';

import '../../features/authentication/screens/screens/signup/signup_screen.dart';

class FadeInAnimationController extends GetxController {
  static FadeInAnimationController get find => Get.find(); // avoid using with instances
  RxBool animate = false.obs;
  
  Future startSplashAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 3000));
    animate.value = false;
    await Future.delayed(const Duration(milliseconds: 2000));
    await Get.to( () => const SignUpScreen());
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
  }
}