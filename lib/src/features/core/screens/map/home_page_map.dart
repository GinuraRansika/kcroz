
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kcroz/src/constants/text_string.dart';
import 'package:kcroz/src/services/firebase_auth_methods.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../../../common_widgets/button/custom_button.dart';

class HomePageMap extends StatefulWidget {
  const HomePageMap({Key? key}) : super(key: key);

  @override
  State<HomePageMap> createState() => _HomePageMapState();
}

class _HomePageMapState extends State<HomePageMap> {
  String username = "";
  String myresponse = "";


  @override
  void initState() {
    super.initState();
    getUsername();
  }

  void getUsername() async {
    // snapshot of the current user's data from the firebase firestore database
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      username = (snapshot.data() as Map<String, dynamic>)['username'];
    });
  }

  postData() async{
    final url = Uri.parse('http://10.0.2.2:8080/summerize/music');
    var response = await http.get(url);
    setState(() {
      String result = response.body;
      myresponse = result.replaceAll("<n>", " ");
      myresponse = result.replaceAll("\\", "");
    });

  }

  @override
  Widget build(BuildContext context) {
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
              Text(username),
              Text(myresponse),
              Text("Name"),
              CustomButton(
                onTap: () {
                  context.read<FirebaseAuthMethods>().signOut(context);
                },
                text: 'Sign Out',
              ),
              CustomButton(
                onTap: () {
                  postData();
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
