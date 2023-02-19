import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kcroz/auth_controller.dart';
import 'package:kcroz/features/authentication/screens/splash_screen/splash_screeen.dart';
import 'package:kcroz/utils/theme/theme.dart';

import 'features/authentication/screens/on_boarding/on_boarding_screen.dart';

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
      theme: KcrozAppTheme.lightTheme,
      darkTheme: KcrozAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: SplashScreen()
    );
  }
}
