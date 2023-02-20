import 'package:flutter/material.dart';
import '../../../../constants/image_string.dart';
import '../../../../constants/text_string.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(image: const AssetImage(kcrozWelcomeScreenImage), height: size.height * 0.2,),
        Text(kcrozLoginTitle, style: Theme.of(context).textTheme.headline1,),
        Text(kcrozLoginSubTitle, style: Theme.of(context).textTheme.bodyText1),
      ],
    );
  }
}
