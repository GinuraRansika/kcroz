import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kcroz/src/common_widgets/form/form_header_widget.dart';
import 'package:kcroz/src/common_widgets/text_field_input.dart';
import 'package:kcroz/src/constants/image_string.dart';
import 'package:kcroz/src/constants/sizes.dart';
import 'package:kcroz/src/constants/text_string.dart';
import 'package:kcroz/src/features/authentication/screens/screens/signup/widgets/signup_footer_widget.dart';
import 'package:kcroz/src/features/authentication/screens/screens/signup/widgets/signup_form_widget.dart';
import 'package:kcroz/src/utils/utils.dart';

import '../../../../../services/firebase_auth_methods.dart';
import '../../../../../services/user_repository.dart';
import '../../controllers/signup_controller.dart';
import '../../models/user_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpController controller = Get.put(SignUpController());
  Uint8List? _image;

  void signUpUser() async {
    final user = UserModel(
        fullName: controller.fullName.text.trim(),
        email: controller.email.text.trim(),
        password: controller.password.text.trim(),
        phoneNo: controller.phoneNo.text.trim());

    // await UserRepository.instance.createUser(user);

    await FirebaseAuthMethods().signUpWithEmail(
        email: controller.email.text,
        fullName: controller.fullName.text,
        phoneNo: controller.phoneNo.text,
        password: controller.password.text,
        context: context);
  }
  
  void selectImage() async {
    Uint8List image = await pickImage(ImageSource.gallery);
    setState(() {
      _image = _image;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(kcrozDefaultSize),
            child: Column(
              children:  [
                // Section - 1 [ Header ]
                const FormHeaderWidget(
                    image: kcrozWelcomeScreenImage,
                    title: kcrozSignUpTitle,
                    subTitle: kcrozSignUpSubTitle,
                    imageHeight: 0.2,
                ),

                // Section - 2 [ Form ]
                Container(
                  padding: const EdgeInsets.symmetric(vertical: kcrozDefaultSize - 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFieldInput(
                        textEditingController: controller.fullName,
                        labelText: kcrozFullName,
                        prefixIcon: const Icon(Icons.person_outline_rounded),
                        hintText: kcrozFullName,
                        textInputType: TextInputType.text,

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
                            onPressed:  signUpUser,
                            child: Text(kcrozSignup.toUpperCase())),
                      )
                    ],
                  ),
                ),
                // Section - 3 [ Footer ]
                const SignUpFooterWidget()
              ],
            ),
          ),
        )
      ),
    );
  }
}



