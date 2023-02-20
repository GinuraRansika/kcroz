import 'package:flutter/material.dart';
import '../../../../../constants/image_string.dart';
import '../../../../../constants/text_string.dart';

class SignUpFooterWidget extends StatelessWidget {
  const SignUpFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("OR"),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Image(image: AssetImage(kcrozGoogleLogoImage), width: 20.0,),
            label: Text(kcrozSignInWithGoogle.toUpperCase()),

          ),
        ),
        TextButton(
            onPressed: () {},
            child: Text.rich(
                TextSpan(
                    children: [
                      TextSpan(
                          text: kcrozAlreadyHavenAccount,
                          style: Theme.of(context).textTheme.bodyText1
                      ),
                      TextSpan(text: " ${kcrozLogin.toUpperCase()}",),
                    ]
                )
            ))
      ],
    );
  }
}