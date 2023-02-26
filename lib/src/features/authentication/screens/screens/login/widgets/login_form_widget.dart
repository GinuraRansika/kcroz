import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../../../../constants/sizes.dart';
import '../../../../../../constants/text_string.dart';
import '../../../../../../services/firebase_auth_methods.dart';
import '../../../controllers/login_controller.dart';
import '../../forget_password/forget_password_options/forget_password_model_bottom_sheet.dart';


class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  LoginController controller = Get.put(LoginController());

  void loginUser() {
    context.read<FirebaseAuthMethods>().loginWithEmail(
        email: controller.email.text,
        password: controller.password.text,
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Form(child: Container(
      key: _formKey,
      padding: const EdgeInsets.symmetric(vertical: kcrozFormHeight - 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: controller.email,
            decoration: const InputDecoration (
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: kcrozEmail,
                hintText: kcrozEmail,
                border: OutlineInputBorder()
            ),
          ),

          const SizedBox(height: kcrozFormHeight - 20,),
          TextFormField(
            controller: controller.password,
            decoration:  InputDecoration (
              prefixIcon: const Icon(Icons.fingerprint),
              labelText: kcrozPassword,
              hintText: kcrozPassword,
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                  onPressed: loginUser,
                  icon: const Icon(Icons.remove_red_eye_sharp)),
            ),
          ),
          const SizedBox(height: kcrozFormHeight - 20,),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
                onPressed: () {
                  ForgetPasswordScreen.buildShowModalBottomSheet(context);
                },
                child: const Text(kcrozForgetPassword)),
          ),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: loginUser,
                  child: Text(kcrozLogin.toUpperCase())
              )
          )
        ],
      ),
    )
    );
  }
}

