import 'package:flutter/material.dart';
import 'package:kcroz/src/common_widgets/form/form_header_widget.dart';
import 'package:kcroz/src/constants/image_string.dart';
import 'package:kcroz/src/constants/sizes.dart';
import 'package:kcroz/src/constants/text_string.dart';
import 'package:kcroz/src/features/authentication/screens/signup/widgets/signup_footer_widget.dart';
import 'package:kcroz/src/features/authentication/screens/signup/widgets/signup_form_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(kcrozDefaultSize),
            child: Column(
              children: const [
                // Section - 1 [ Header ]
                FormHeaderWidget(
                    image: kcrozWelcomeScreenImage,
                    title: kcrozSignUpTitle,
                    subTitle: kcrozSignUpSubTitle,
                    imageHeight: 0.2,
                ),

                // Section - 2 [ Form ]
                SignUpFormWidget(),

                // Section - 3 [ Footer ]
                SignUpFooterWidget()

              ],
            ),
          ),
        )
      ),
    );
  }
}



