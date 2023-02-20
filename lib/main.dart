import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kcroz/auth_controller.dart';
import 'package:kcroz/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:kcroz/src/utils/theme/theme.dart';

main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp()
  //     .then((value) => Get.put(AuthController())); // dependency injection
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: KcrozAppTheme.lightTheme,
      darkTheme: KcrozAppTheme.darkTheme,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
      home: SplashScreen()
    );
  }
}
