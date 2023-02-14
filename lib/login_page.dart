import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kcroz/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width; // Will access the width
    double height = MediaQuery.of(context).size.height; // Will access the height
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container (
            width: width,
            height: height * 0.3,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "img/loginimg.png"
                ),
                fit: BoxFit.cover
              )
            ),

          ),
          Container (
            margin: const EdgeInsets.only(left:20, right: 20),
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Hello",
                  style: TextStyle (
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                  )
                ),
                Text (
                    "Sign into your account",
                    style: TextStyle (
                      fontSize: 20,
                      color: Colors.grey[500]
                    )
                ),
                const SizedBox(height: 50),
                Container (
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 7,
                        offset: const Offset(1, 1),
                        color: Colors.grey.withOpacity(0.2)
                      )
                    ]
                  ),
                  child: TextField (
                    decoration: InputDecoration (
                      hintText: "Email",
                      prefixIcon: const Icon(Icons.email, color: Colors.deepOrangeAccent,),
                      focusedBorder: OutlineInputBorder (
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.white
                        )
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1.0
                        ),
                      ),
                      border: OutlineInputBorder (
                          borderRadius: BorderRadius.circular(30)
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container (
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 7,
                        offset: const Offset(1, 1),
                        color: Colors.grey.withOpacity(0.2)
                      )
                    ]
                  ),
                  child: TextField (
                    decoration: InputDecoration (
                      hintText: "Password",
                      prefixIcon: const Icon(Icons.password_outlined, color: Colors.deepOrangeAccent,),
                      focusedBorder: OutlineInputBorder (
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.white
                        )
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1.0
                        ),
                      ),
                      border: OutlineInputBorder (
                          borderRadius: BorderRadius.circular(30)
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row (
                  children: [
                    Expanded(child: Container(),),
                    Text (
                        "Forgot your Password?",
                        style: TextStyle (
                            fontSize: 15,
                            color: Colors.grey[500]
                        )
                    )
                  ],
                )

              ],
            ),
          ),
          const SizedBox(height: 70,),
          Container (
            width: width * 0.6,
            height: height * 0.08,
            decoration: BoxDecoration (
              borderRadius: BorderRadius.circular(30),
                image: const DecorationImage(
                    image: AssetImage(
                        "img/loginbtn.png"
                    ),
                    fit: BoxFit.cover
                )
            ),
            child: const Center(
              child: Text (
                  "Sign in",
                  style: TextStyle (
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  )
              ),
            ),

          ),
          SizedBox(height: width * 0.2,),
          // allow you to modify the part of the text
          RichText(text: TextSpan(
            text: "Don't have an account? ",
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 18
            ),
            // below text will show right next to the previous text
            children: [
              TextSpan(
              text: "Create",
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
                // double dots saves you rewrite and create an object and get the property
                recognizer: TapGestureRecognizer()..onTap=() { Get.to(() => const SignUpPage());
                }
              )
            ]
          ))
        ],
      ),
    );
  }
}
