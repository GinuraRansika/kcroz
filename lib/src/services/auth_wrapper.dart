
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:kcroz/src/features/authentication/screens/screens/welcome/welcome_screen.dart';
import 'package:provider/provider.dart';

import '../features/core/screens/map/home_page_map.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return const HomePageMap();
    }
    return const WelcomeScreen();
  }
}