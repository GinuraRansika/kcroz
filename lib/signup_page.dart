import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kcroz/auth_controller.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    List signupMethodsImages = [
      "g.png",
      "t.png",
      "f.png"
    ];

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
                        "img/signup.png"
                    ),
                    fit: BoxFit.cover
                )
            ),
            child: Column(
              children: [
                SizedBox(height: height * 0.16,),
                const CircleAvatar(
                  backgroundColor: Colors.white70,
                  radius: 60,
                  backgroundImage: AssetImage(
                    "img/profile1.png"
                  ),
                )
              ],
            ),
          ),
          Container (
            margin: const EdgeInsets.only(left:20, right: 20),
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                    controller: emailController,
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
                    controller: passwordController,
                    obscureText: true,
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
              ],
            ),
          ),
          const SizedBox(height: 70,),
          GestureDetector(
            onTap: () {
              AuthController.instance.register(emailController.text.trim(), passwordController.text.trim());
            },
            child: Container (
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
                    "Sign up",
                    style: TextStyle (
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    )
                ),
              ),
            ),
          ),
          const SizedBox(height: 10,),
          RichText(
              text: TextSpan(
                  recognizer: TapGestureRecognizer().. onTap=(){ Get.back();},
                  text: "Have an account?",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[500]
                  )
              )
          ),
          SizedBox(height: width * 0.2,),
          // allow you to modify the part of the text
          RichText(text: TextSpan(
              text: "Sign up using one of the following methods",
              style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 16
              ),
          )),
          Wrap(
            children: List<Widget>.generate( 3, (index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: CircleAvatar (
                  radius: 30,
                  backgroundColor: Colors.grey[200],
                  child: CircleAvatar (
                    radius: 25,
                    backgroundImage: AssetImage(
                      "img/" + signupMethodsImages[index]
                    ),
                  ),
                ),
              );
            }),
            
          )
        ],
      ),
    );
  }
}