import 'package:flutter/material.dart';
import 'package:kcroz/src/constants/colors.dart';
import 'package:kcroz/src/constants/sizes.dart';
import 'package:kcroz/src/constants/text_string.dart';
import '../../../../constants/image_string.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;

    // to use primary color as our background color in light mode
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark; // boolean


    return Scaffold(
      backgroundColor: isDarkMode ? kcrozSecondaryColor : kcrozPrimaryColor,
      body: Container(
        padding: const EdgeInsets.all(kcrozDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(image: const AssetImage(kcrozWelcomeScreenImage), height: height * 0.6,),
            Column(
              children: [
                Text(
                  kcrozWelcomeTitle,
                  style: Theme.of(context).textTheme.headline3,
                ),
                Text(
                  kcrozWelcomeSubTitle,
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: OutlinedButton(
                        onPressed: () {},
                        child: Text(kcrozLogin.toUpperCase())
                    )
                ),
                const SizedBox(width: 10.0,),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text(kcrozSignup.toUpperCase())
                    )
                ),
              ],
            )
          ],

        ),
      ),
    );
  }
}
