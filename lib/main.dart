import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kcroz/firebase_options.dart';
import 'package:kcroz/src/features/authentication/screens/on_boarding/on_boarding_screen.dart';
import 'package:kcroz/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:kcroz/src/repository/authentication_repository/authentication_repository.dart';
import 'package:kcroz/src/utils/theme/theme.dart';

main() {
  // everytime run the app firebase will get initialized and authenticationRepository get initialized
  WidgetsFlutterBinding.ensureInitialized();

  Firebase.initializeApp(
    name: "kcroz-app",
    options: DefaultFirebaseOptions.currentPlatform)
    .then((value) => Get.put(AuthenticationRepository()));
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
      home: const OnBoardingScreen()
    );
  }
}
