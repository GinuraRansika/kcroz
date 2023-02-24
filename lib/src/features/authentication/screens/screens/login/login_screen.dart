import 'package:flutter/material.dart';
import 'package:kcroz/src/constants/sizes.dart';
import 'package:kcroz/src/constants/text_string.dart';
import '../../../../../common_widgets/form/form_header_widget.dart';
import '../../../../../constants/image_string.dart';
import 'widgets/ login_footer_widget.dart';
import 'widgets/login_form_widget.dart';

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
                  FormHeaderWidget(
                    image: kcrozWelcomeScreenImage,
                    title: kcrozLoginTitle,
                    subTitle: kcrozLoginTitle,
                    imageHeight: 0.2,
                  ),
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