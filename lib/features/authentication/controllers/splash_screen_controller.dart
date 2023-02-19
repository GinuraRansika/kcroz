import 'package:flutter/material.dart';
import 'package:kcroz/constants/colors.dart';
import 'package:kcroz/constants/image_string.dart';
import 'package:kcroz/constants/sizes.dart';
import 'package:kcroz/constants/text_string.dart';
import 'package:kcroz/signup_page.dart';
import 'package:kcroz/welcome_page.dart';

import '../../../login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animate = false;

  @override
  void initState() {
    startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              top: animate ? 0 : -30,
              left: animate ? 0 : -30,
              child: const Image(image: AssetImage(kcrozSplashTopIcon))),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 1600),
            top: 80,
            left: animate ? kcrozDefaultSize : -80,
            child: Column(
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
          const Positioned(
              bottom: 100,
              child: Image(image: AssetImage(kcrozSplashBottomIcon))),
          Positioned(
              bottom: 40,
              right: kcrozDefaultSize,
              child: Container(
                width: kcrozSplashContainerSize,
                height: kcrozSplashContainerSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: kcrozPrimaryColor,
                ),
              ))
        ],
      ),
    );
  }

  Future startAnimation() async {
    await Future.delayed(Duration(milliseconds: 500));
    setState(() => animate = true);
    await Future.delayed(Duration(milliseconds: 5000));
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const LoginPage()));
  }
}
