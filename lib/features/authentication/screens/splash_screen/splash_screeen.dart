import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kcroz/constants/colors.dart';
import 'package:kcroz/constants/image_string.dart';
import 'package:kcroz/constants/sizes.dart';
import 'package:kcroz/constants/text_string.dart';
import 'package:kcroz/features/authentication/controllers/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final splashController = Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    splashController.startAnimation();
    return Scaffold(
      body: Stack(
        children: [
          // observer will observe below element
          Obx( () => AnimatedPositioned (
              duration: const Duration(milliseconds: 1600),
              top: splashController.animate.value ? 0 : -30,
              left: splashController.animate.value ? 0 : -30,
              child: const Image(image: AssetImage(kcrozSplashTopIcon))),
          ),

          Obx( () => AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              top: 80,
              left: splashController.animate.value ? kcrozDefaultSize : -80,
              child: AnimatedOpacity (
                duration: const Duration(milliseconds: 1600),
                opacity: splashController.animate.value ? 1 : 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      kcrozAppName,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Text(
                      kcrozAppTagLine,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
              ),
            ),
          ),

          Obx( () => AnimatedPositioned (
              duration: const Duration(milliseconds: 2400),
              bottom: 100,
              child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 2000),
                  opacity: splashController.animate.value ? 1 : 0,
                  child: const Image(image: AssetImage(kcrozSplashBottomIcon)))),
          ),

          Obx( () => AnimatedPositioned (
              bottom: splashController.animate.value ? 60: 0,
              right: kcrozDefaultSize,
              duration: const Duration(milliseconds: 2400),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 2000),
                opacity: splashController.animate.value ? 1: 0,
                child: Container(
                  width: kcrozSplashContainerSize,
                  height: kcrozSplashContainerSize,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: kcrozPrimaryColor,
                  ),
                )
              )
            ),
          )
        ],
      ),
    );
  }
}
