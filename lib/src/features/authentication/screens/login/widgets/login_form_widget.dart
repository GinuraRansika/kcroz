import 'package:flutter/material.dart';
import 'package:kcroz/src/features/authentication/screens/forget_password/forget_password_options/forget_password_model_bottom_sheet.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_string.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(child: Container(
      padding: const EdgeInsets.symmetric(vertical: kcrozFormHeight - 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration (
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: kcrozEmail,
                hintText: kcrozEmail,
                border: OutlineInputBorder()
            ),
          ),

          const SizedBox(height: kcrozFormHeight - 20,),
          TextFormField(
            decoration: const InputDecoration (
              prefixIcon: Icon(Icons.fingerprint),
              labelText: kcrozPassword,
              hintText: kcrozPassword,
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.remove_red_eye_sharp)),
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
                  onPressed: () {},
                  child: Text(kcrozLogin.toUpperCase())
              )
          )
        ],
      ),
    )
    );
  }
}

