import 'package:flutter/material.dart';
import 'package:kcroz/src/constants/image_string.dart';
import 'package:kcroz/src/constants/sizes.dart';
import 'package:kcroz/src/constants/text_string.dart';

import ' login_footer_widget.dart';
import 'login_form_widget.dart';
import 'login_header_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // To make the layout scrollable
        body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(kcrozDefaultSize),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  // Section - 1
                  LoginHeaderWidget(),
                  // Section - 2 [ Form ]
                  LoginForm(),
                  // Section - 3
                  LoginFooterWidget()
                ],
              ),
            ),
        )
      ),
    );
  }
}