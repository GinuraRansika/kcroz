import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kcroz/src/features/authentication/controllers/signup_controller.dart';
import 'package:kcroz/src/home_page.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_string.dart';
import '../../forget_password/forget_password_otp/otp_screen.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: kcrozDefaultSize - 10),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.fullName,
              decoration: const InputDecoration(
                label: Text(kcrozFullName),
                prefixIcon: Icon(Icons.person_outline_rounded),
              ),
            ),
            const SizedBox(height: kcrozDefaultSize - 20,),
            TextFormField(
              controller: controller.email,
              decoration: const InputDecoration(
                label: Text(kcrozEmail),
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            const SizedBox(height: kcrozDefaultSize - 20,),
            TextFormField(
              controller: controller.phoneNo,
              decoration: const InputDecoration(
                label: Text(kcrozPhoneNo),
                prefixIcon: Icon(Icons.numbers),
              ),
            ),
            const SizedBox(height: kcrozDefaultSize - 20,),
            TextFormField(
              controller: controller.password,
              decoration: const InputDecoration(
                label: Text(kcrozPassword),
                prefixIcon: Icon(Icons.fingerprint),
              ),
            ),
            const SizedBox(height: kcrozDefaultSize - 10,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: (){
                    // formKey means the form is validated
                    if(_formKey.currentState!.validate()){
                      SignUpController.instance.registerUser(controller.email.text.trim(), controller.password.text.trim());
                      // SignUpController.instance.phoneAuthentication(controller.phoneNo.text.trim());

                    }
                  },
                  child: Text(kcrozSignup.toUpperCase())),
            )
          ],
        ),
      ),
    );
  }
}
