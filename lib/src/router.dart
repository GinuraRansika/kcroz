import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kcroz/src/features/authentication/screens/screens/forget_password/forget_password_otp/otp_screen.dart';
import 'package:kcroz/src/features/authentication/screens/screens/login/login_screen.dart';

import 'common_widgets/error.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch(settings.name)
  {
    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );
    // case OTPScreen.routeName:
    //   return MaterialPageRoute(
    //     builder: (context) => const OTPScreen(),
    //   );
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold(
        body: ErrorScreen(error:"This page doesn't exist"),
      ),);
  }
}
