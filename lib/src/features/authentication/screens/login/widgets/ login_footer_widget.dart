import 'package:flutter/material.dart';
import '../../../../../constants/image_string.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_string.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        const SizedBox(height: kcrozFormHeight - 20,),
        SizedBox( // make it cover the complete screen
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: const Image(image: AssetImage(kcrozGoogleLogoImage), width: 20.0,),
            onPressed: () {},
            label: const Text(kcrozSignInWithGoogle),
          ),
        ),
        const SizedBox(height: kcrozFormHeight - 20,),
        TextButton(
            onPressed: () {},
            child: Text.rich(TextSpan(
                text: dontHaveAnAccount,
                style: Theme.of(context).textTheme.bodyText1,
                children: const [
                  TextSpan(
                    text: " $kcrozSignup",
                    style: TextStyle(color: Colors.blue),
                  )
                ]
            ))
        )
      ],
    );
  }
}