import 'package:flutter/material.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_string.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: kcrozDefaultSize - 10),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                label: Text(kcrozFullName),
                prefixIcon: Icon(Icons.person_outline_rounded),
              ),
            ),
            const SizedBox(height: kcrozDefaultSize - 20,),
            TextFormField(
              decoration: const InputDecoration(
                label: Text(kcrozEmail),
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            const SizedBox(height: kcrozDefaultSize - 20,),
            TextFormField(
              decoration: const InputDecoration(
                label: Text(kcrozPhoneNo),
                prefixIcon: Icon(Icons.numbers),
              ),
            ),
            const SizedBox(height: kcrozDefaultSize - 20,),
            TextFormField(
              decoration: const InputDecoration(
                label: Text(kcrozPassword),
                prefixIcon: Icon(Icons.fingerprint),
              ),
            ),
            const SizedBox(height: kcrozDefaultSize - 10,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: (){},
                  child: Text(kcrozSignup.toUpperCase())),
            )
          ],
        ),
      ),
    );
  }
}
