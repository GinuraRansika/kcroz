import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kcroz/src/constants/text_string.dart';
import 'package:kcroz/src/services/firebase_auth_methods.dart';
import 'package:provider/provider.dart';

import '../../../../common_widgets/button/custom_button.dart';

class HomePageMap extends StatelessWidget {
  const HomePageMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.read<FirebaseAuthMethods>().user;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu, color: Colors.black,),
        title: Text(kcrozAppName, style: Theme.of(context).textTheme.headline4,),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey,
            ),
            child: IconButton(
              onPressed: () {
                FirebaseAuthMethods().signOut(context);
                },
              icon: const Icon(Icons.logout_outlined),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // when user signs anonymously or with phone, there is no email
              if (user.phoneNumber == null) Text(user.email!),
              if (user.phoneNumber == null)
                Text(user.providerData[0].providerId),
              // display phone number only when user's phone number is not null
              if (user.phoneNumber != null) Text(user.phoneNumber!),
              // uid is always available for every sign in method
              Text(user.uid),
              // display the button only when the user email is not verified
              // or isnt an anonymous user
              if (!user.emailVerified)
                CustomButton(
                  onTap: () {
                    context
                        .read<FirebaseAuthMethods>()
                        .sendEmailVerification(context);
                  },
                  text: 'Verify Email',
                ),
              CustomButton(
                onTap: () {
                  context.read<FirebaseAuthMethods>().signOut(context);
                },
                text: 'Sign Out',
              ),
              CustomButton(
                onTap: () {
                  context.read<FirebaseAuthMethods>().deleteAccount(context);
                },
                text: 'Delete Account',
              ),
            ],

          ),

          
        ),
      ),
    );
  }
}