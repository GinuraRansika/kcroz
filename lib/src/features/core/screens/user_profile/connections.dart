import 'dart:typed_data';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kcroz/src/features/core/screens/user_profile/edit_profile.dart';
import 'package:kcroz/src/features/core/screens/user_profile/settings_page.dart';
import 'package:kcroz/src/features/core/screens/user_profile/user_profile_screen.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../../../utils/utils.dart';
import 'profile_bio.dart';
import 'profile_interests.dart';
import 'profile_settings.dart';
import 'user_profile_screen.dart';
import 'package:provider/provider.dart';
import 'profile_feed.dart';

import '../../../../constants/text_string.dart';


class Connections extends StatefulWidget {
  const Connections({Key? key}) : super(key: key);

  @override
  State<Connections> createState() => _ConnectionsState();
}

class _ConnectionsState extends State<Connections> {



  @override
  Widget build(BuildContext context) {
    // var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        title: Text('Connections', style: Theme.of(context).textTheme.headline4,),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.connect_without_contact_rounded))
        ],

      ),

      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [

              Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    child:
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0), //or 15.0
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        height: 80.0,
                        width: 80.0,
                        color: Colors.transparent,
                        child: Image.network(
                          'https://blogger.googleusercontent.com/img/a/AVvXsEjA3yU3DQvoZfKBHzkcIumfUyxaUYDVVWSQcu5ikh8PW_UQx_wxTNivemQn1MY1TsjvFVDesueMPmTk-FWnYErepqHjvi9Ni4hSTvhlNfFIBsOLYjCnfq4sxeTkVNPjm7GApYXQSRd3Bwe7I06FqWu8Ja2W7VM7nsJf-ZwO59ckAJvjD2_cI0TjEwVE=s895',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(top: 40.0),
                    width: 150,
                    height: 100,
                    child: const Text('Anne Marie', style: TextStyle(
                      fontSize: 15,

                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sans-serif',),),
                  ),

                  Container(
                    width: 50,
                    height: 100,
                    child:
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSettings()),);
                      },
                      child:
                      const Icon(Icons.message_rounded,
                        size: 30,
                        color: Color(0xFFCF9FFF),),
                    ),
                  ),

                  Container(
                    width: 50,
                    height: 100,
                    child:
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSettings()),);
                      },
                      child:
                      const Icon(Icons.call_rounded,
                        size: 30,
                        color: Color(0xFFCF9FFF),),
                    ),
                  ),

                  Container(
                    width: 50,
                    height: 100,
                    child:
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSettings()),);
                      },
                      child:
                      const Icon(Icons.video_call_rounded,
                        size: 40,
                        color: Color(0xFFCF9FFF),),
                    ),
                  ),
                ],

              ),

              Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    child:
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0), //or 15.0
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        height: 80.0,
                        width: 80.0,
                        color: Colors.transparent,
                        child: Image.network(
                          'https://blogger.googleusercontent.com/img/a/AVvXsEjA3yU3DQvoZfKBHzkcIumfUyxaUYDVVWSQcu5ikh8PW_UQx_wxTNivemQn1MY1TsjvFVDesueMPmTk-FWnYErepqHjvi9Ni4hSTvhlNfFIBsOLYjCnfq4sxeTkVNPjm7GApYXQSRd3Bwe7I06FqWu8Ja2W7VM7nsJf-ZwO59ckAJvjD2_cI0TjEwVE=s895',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(top: 40.0),
                    width: 150,
                    height: 100,
                    child: const Text('Anne Marie', style: TextStyle(
                      fontSize: 15,

                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sans-serif',),),
                  ),

                  Container(
                    width: 50,
                    height: 100,
                    child:
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSettings()),);
                      },
                      child:
                      const Icon(Icons.message_rounded,
                        size: 30,
                        color: Color(0xFFCF9FFF),),
                    ),
                  ),

                  Container(
                    width: 50,
                    height: 100,
                    child:
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSettings()),);
                      },
                      child:
                      const Icon(Icons.call_rounded,
                        size: 30,
                        color: Color(0xFFCF9FFF),),
                    ),
                  ),

                  Container(
                    width: 50,
                    height: 100,
                    child:
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSettings()),);
                      },
                      child:
                      const Icon(Icons.video_call_rounded,
                        size: 40,
                        color: Color(0xFFCF9FFF),),
                    ),
                  ),
                ],

              ),

              Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    child:
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0), //or 15.0
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        height: 80.0,
                        width: 80.0,
                        color: Colors.transparent,
                        child: Image.network(
                          'https://blogger.googleusercontent.com/img/a/AVvXsEjA3yU3DQvoZfKBHzkcIumfUyxaUYDVVWSQcu5ikh8PW_UQx_wxTNivemQn1MY1TsjvFVDesueMPmTk-FWnYErepqHjvi9Ni4hSTvhlNfFIBsOLYjCnfq4sxeTkVNPjm7GApYXQSRd3Bwe7I06FqWu8Ja2W7VM7nsJf-ZwO59ckAJvjD2_cI0TjEwVE=s895',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(top: 40.0),
                    width: 150,
                    height: 100,
                    child: const Text('Anne Marie', style: TextStyle(
                      fontSize: 15,

                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sans-serif',),),
                  ),

                  Container(
                    width: 50,
                    height: 100,
                    child:
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSettings()),);
                      },
                      child:
                      const Icon(Icons.message_rounded,
                        size: 30,
                        color: Color(0xFFCF9FFF),),
                    ),
                  ),

                  Container(
                    width: 50,
                    height: 100,
                    child:
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSettings()),);
                      },
                      child:
                      const Icon(Icons.call_rounded,
                        size: 30,
                        color: Color(0xFFCF9FFF),),
                    ),
                  ),

                  Container(
                    width: 50,
                    height: 100,
                    child:
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSettings()),);
                      },
                      child:
                      const Icon(Icons.video_call_rounded,
                        size: 40,
                        color: Color(0xFFCF9FFF),),
                    ),
                  ),
                ],

              ),

              Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    child:
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0), //or 15.0
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        height: 80.0,
                        width: 80.0,
                        color: Colors.transparent,
                        child: Image.network(
                          'https://blogger.googleusercontent.com/img/a/AVvXsEjA3yU3DQvoZfKBHzkcIumfUyxaUYDVVWSQcu5ikh8PW_UQx_wxTNivemQn1MY1TsjvFVDesueMPmTk-FWnYErepqHjvi9Ni4hSTvhlNfFIBsOLYjCnfq4sxeTkVNPjm7GApYXQSRd3Bwe7I06FqWu8Ja2W7VM7nsJf-ZwO59ckAJvjD2_cI0TjEwVE=s895',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(top: 40.0),
                    width: 150,
                    height: 100,
                    child: const Text('Anne Marie', style: TextStyle(
                      fontSize: 15,

                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sans-serif',),),
                  ),

                  Container(
                    width: 50,
                    height: 100,
                    child:
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSettings()),);
                      },
                      child:
                      const Icon(Icons.message_rounded,
                        size: 30,
                        color: Color(0xFFCF9FFF),),
                    ),
                  ),

                  Container(
                    width: 50,
                    height: 100,
                    child:
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSettings()),);
                      },
                      child:
                      const Icon(Icons.call_rounded,
                        size: 30,
                        color: Color(0xFFCF9FFF),),
                    ),
                  ),

                  Container(
                    width: 50,
                    height: 100,
                    child:
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSettings()),);
                      },
                      child:
                      const Icon(Icons.video_call_rounded,
                        size: 40,
                        color: Color(0xFFCF9FFF),),
                    ),
                  ),
                ],

              ),

              Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    child:
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0), //or 15.0
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        height: 80.0,
                        width: 80.0,
                        color: Colors.transparent,
                        child: Image.network(
                          'https://blogger.googleusercontent.com/img/a/AVvXsEjA3yU3DQvoZfKBHzkcIumfUyxaUYDVVWSQcu5ikh8PW_UQx_wxTNivemQn1MY1TsjvFVDesueMPmTk-FWnYErepqHjvi9Ni4hSTvhlNfFIBsOLYjCnfq4sxeTkVNPjm7GApYXQSRd3Bwe7I06FqWu8Ja2W7VM7nsJf-ZwO59ckAJvjD2_cI0TjEwVE=s895',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(top: 40.0),
                    width: 150,
                    height: 100,
                    child: const Text('Anne Marie', style: TextStyle(
                      fontSize: 15,

                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sans-serif',),),
                  ),

                  Container(
                    width: 50,
                    height: 100,
                    child:
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSettings()),);
                      },
                      child:
                      const Icon(Icons.message_rounded,
                        size: 30,
                        color: Color(0xFFCF9FFF),),
                    ),
                  ),

                  Container(
                    width: 50,
                    height: 100,
                    child:
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSettings()),);
                      },
                      child:
                      const Icon(Icons.call_rounded,
                        size: 30,
                        color: Color(0xFFCF9FFF),),
                    ),
                  ),

                  Container(
                    width: 50,
                    height: 100,
                    child:
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSettings()),);
                      },
                      child:
                      const Icon(Icons.video_call_rounded,
                        size: 40,
                        color: Color(0xFFCF9FFF),),
                    ),
                  ),
                ],

              ),

              Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    child:
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0), //or 15.0
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        height: 80.0,
                        width: 80.0,
                        color: Colors.transparent,
                        child: Image.network(
                          'https://blogger.googleusercontent.com/img/a/AVvXsEjA3yU3DQvoZfKBHzkcIumfUyxaUYDVVWSQcu5ikh8PW_UQx_wxTNivemQn1MY1TsjvFVDesueMPmTk-FWnYErepqHjvi9Ni4hSTvhlNfFIBsOLYjCnfq4sxeTkVNPjm7GApYXQSRd3Bwe7I06FqWu8Ja2W7VM7nsJf-ZwO59ckAJvjD2_cI0TjEwVE=s895',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(top: 40.0),
                    width: 150,
                    height: 100,
                    child: const Text('Anne Marie', style: TextStyle(
                      fontSize: 15,

                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sans-serif',),),
                  ),

                  Container(
                    width: 50,
                    height: 100,
                    child:
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSettings()),);
                      },
                      child:
                      const Icon(Icons.message_rounded,
                        size: 30,
                        color: Color(0xFFCF9FFF),),
                    ),
                  ),

                  Container(
                    width: 50,
                    height: 100,
                    child:
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSettings()),);
                      },
                      child:
                      const Icon(Icons.call_rounded,
                        size: 30,
                        color: Color(0xFFCF9FFF),),
                    ),
                  ),

                  Container(
                    width: 50,
                    height: 100,
                    child:
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSettings()),);
                      },
                      child:
                      const Icon(Icons.video_call_rounded,
                        size: 40,
                        color: Color(0xFFCF9FFF),),
                    ),
                  ),
                ],

              ),

              Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    child:
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0), //or 15.0
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        height: 80.0,
                        width: 80.0,
                        color: Colors.transparent,
                        child: Image.network(
                          'https://blogger.googleusercontent.com/img/a/AVvXsEjA3yU3DQvoZfKBHzkcIumfUyxaUYDVVWSQcu5ikh8PW_UQx_wxTNivemQn1MY1TsjvFVDesueMPmTk-FWnYErepqHjvi9Ni4hSTvhlNfFIBsOLYjCnfq4sxeTkVNPjm7GApYXQSRd3Bwe7I06FqWu8Ja2W7VM7nsJf-ZwO59ckAJvjD2_cI0TjEwVE=s895',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(top: 40.0),
                    width: 150,
                    height: 100,
                    child: const Text('Anne Marie', style: TextStyle(
                      fontSize: 15,

                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sans-serif',),),
                  ),

                  Container(
                    width: 50,
                    height: 100,
                    child:
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSettings()),);
                      },
                      child:
                      const Icon(Icons.message_rounded,
                        size: 30,
                        color: Color(0xFFCF9FFF),),
                    ),
                  ),

                  Container(
                    width: 50,
                    height: 100,
                    child:
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSettings()),);
                      },
                      child:
                      const Icon(Icons.call_rounded,
                        size: 30,
                        color: Color(0xFFCF9FFF),),
                    ),
                  ),

                  Container(
                    width: 50,
                    height: 100,
                    child:
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSettings()),);
                      },
                      child:
                      const Icon(Icons.video_call_rounded,
                        size: 40,
                        color: Color(0xFFCF9FFF),),
                    ),
                  ),
                ],

              ),

              Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    child:
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0), //or 15.0
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        height: 80.0,
                        width: 80.0,
                        color: Colors.transparent,
                        child: Image.network(
                          'https://blogger.googleusercontent.com/img/a/AVvXsEjA3yU3DQvoZfKBHzkcIumfUyxaUYDVVWSQcu5ikh8PW_UQx_wxTNivemQn1MY1TsjvFVDesueMPmTk-FWnYErepqHjvi9Ni4hSTvhlNfFIBsOLYjCnfq4sxeTkVNPjm7GApYXQSRd3Bwe7I06FqWu8Ja2W7VM7nsJf-ZwO59ckAJvjD2_cI0TjEwVE=s895',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(top: 40.0),
                    width: 150,
                    height: 100,
                    child: const Text('Anne Marie', style: TextStyle(
                      fontSize: 15,

                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sans-serif',),),
                  ),

                  Container(
                    width: 50,
                    height: 100,
                    child:
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSettings()),);
                      },
                      child:
                      const Icon(Icons.message_rounded,
                        size: 30,
                        color: Color(0xFFCF9FFF),),
                    ),
                  ),

                  Container(
                    width: 50,
                    height: 100,
                    child:
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSettings()),);
                      },
                      child:
                      const Icon(Icons.call_rounded,
                        size: 30,
                        color: Color(0xFFCF9FFF),),
                    ),
                  ),

                  Container(
                    width: 50,
                    height: 100,
                    child:
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSettings()),);
                      },
                      child:
                      const Icon(Icons.video_call_rounded,
                        size: 40,
                        color: Color(0xFFCF9FFF),),
                    ),
                  ),
                ],

              ),

              Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    child:
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0), //or 15.0
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        height: 80.0,
                        width: 80.0,
                        color: Colors.transparent,
                        child: Image.network(
                          'https://blogger.googleusercontent.com/img/a/AVvXsEjA3yU3DQvoZfKBHzkcIumfUyxaUYDVVWSQcu5ikh8PW_UQx_wxTNivemQn1MY1TsjvFVDesueMPmTk-FWnYErepqHjvi9Ni4hSTvhlNfFIBsOLYjCnfq4sxeTkVNPjm7GApYXQSRd3Bwe7I06FqWu8Ja2W7VM7nsJf-ZwO59ckAJvjD2_cI0TjEwVE=s895',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(top: 40.0),
                    width: 150,
                    height: 100,
                    child: const Text('Anne Marie', style: TextStyle(
                      fontSize: 15,

                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sans-serif',),),
                  ),

                  Container(
                    width: 50,
                    height: 100,
                    child:
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSettings()),);
                      },
                      child:
                      const Icon(Icons.message_rounded,
                        size: 30,
                        color: Color(0xFFCF9FFF),),
                    ),
                  ),

                  Container(
                    width: 50,
                    height: 100,
                    child:
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSettings()),);
                      },
                      child:
                      const Icon(Icons.call_rounded,
                        size: 30,
                        color: Color(0xFFCF9FFF),),
                    ),
                  ),

                  Container(
                    width: 50,
                    height: 100,
                    child:
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSettings()),);
                      },
                      child:
                      const Icon(Icons.video_call_rounded,
                        size: 40,
                        color: Color(0xFFCF9FFF),),
                    ),
                  ),
                ],

              ),

              Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    child:
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0), //or 15.0
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        height: 80.0,
                        width: 80.0,
                        color: Colors.transparent,
                        child: Image.network(
                          'https://blogger.googleusercontent.com/img/a/AVvXsEjA3yU3DQvoZfKBHzkcIumfUyxaUYDVVWSQcu5ikh8PW_UQx_wxTNivemQn1MY1TsjvFVDesueMPmTk-FWnYErepqHjvi9Ni4hSTvhlNfFIBsOLYjCnfq4sxeTkVNPjm7GApYXQSRd3Bwe7I06FqWu8Ja2W7VM7nsJf-ZwO59ckAJvjD2_cI0TjEwVE=s895',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(top: 40.0),
                    width: 150,
                    height: 100,
                    child: const Text('Anne Marie', style: TextStyle(
                      fontSize: 15,

                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sans-serif',),),
                  ),

                  Container(
                    width: 50,
                    height: 100,
                    child:
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSettings()),);
                      },
                      child:
                      const Icon(Icons.message_rounded,
                        size: 30,
                        color: Color(0xFFCF9FFF),),
                    ),
                  ),

                  Container(
                    width: 50,
                    height: 100,
                    child:
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSettings()),);
                      },
                      child:
                      const Icon(Icons.call_rounded,
                        size: 30,
                        color: Color(0xFFCF9FFF),),
                    ),
                  ),

                  Container(
                    width: 50,
                    height: 100,
                    child:
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSettings()),);
                      },
                      child:
                      const Icon(Icons.video_call_rounded,
                        size: 40,
                        color: Color(0xFFCF9FFF),),
                    ),
                  ),
                ],

              ),

              Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    child:
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0), //or 15.0
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        height: 80.0,
                        width: 80.0,
                        color: Colors.transparent,
                        child: Image.network(
                          'https://blogger.googleusercontent.com/img/a/AVvXsEjA3yU3DQvoZfKBHzkcIumfUyxaUYDVVWSQcu5ikh8PW_UQx_wxTNivemQn1MY1TsjvFVDesueMPmTk-FWnYErepqHjvi9Ni4hSTvhlNfFIBsOLYjCnfq4sxeTkVNPjm7GApYXQSRd3Bwe7I06FqWu8Ja2W7VM7nsJf-ZwO59ckAJvjD2_cI0TjEwVE=s895',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(top: 40.0),
                    width: 150,
                    height: 100,
                    child: const Text('Anne Marie', style: TextStyle(
                      fontSize: 15,

                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sans-serif',),),
                  ),

                  Container(
                    width: 50,
                    height: 100,
                    child:
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSettings()),);
                      },
                      child:
                      const Icon(Icons.message_rounded,
                        size: 30,
                        color: Color(0xFFCF9FFF),),
                    ),
                  ),

                  Container(
                    width: 50,
                    height: 100,
                    child:
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSettings()),);
                      },
                      child:
                      const Icon(Icons.call_rounded,
                        size: 30,
                        color: Color(0xFFCF9FFF),),
                    ),
                  ),

                  Container(
                    width: 50,
                    height: 100,
                    child:
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSettings()),);
                      },
                      child:
                      const Icon(Icons.video_call_rounded,
                        size: 40,
                        color: Color(0xFFCF9FFF),),
                    ),
                  ),
                ],

              ),

              Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    child:
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0), //or 15.0
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        height: 80.0,
                        width: 80.0,
                        color: Colors.transparent,
                        child: Image.network(
                          'https://blogger.googleusercontent.com/img/a/AVvXsEjA3yU3DQvoZfKBHzkcIumfUyxaUYDVVWSQcu5ikh8PW_UQx_wxTNivemQn1MY1TsjvFVDesueMPmTk-FWnYErepqHjvi9Ni4hSTvhlNfFIBsOLYjCnfq4sxeTkVNPjm7GApYXQSRd3Bwe7I06FqWu8Ja2W7VM7nsJf-ZwO59ckAJvjD2_cI0TjEwVE=s895',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(top: 40.0),
                    width: 150,
                    height: 100,
                    child: const Text('Anne Marie', style: TextStyle(
                      fontSize: 15,

                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sans-serif',),),
                  ),

                  Container(
                    width: 50,
                    height: 100,
                    child:
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSettings()),);
                      },
                      child:
                      const Icon(Icons.message_rounded,
                        size: 30,
                        color: Color(0xFFCF9FFF),),
                    ),
                  ),

                  Container(
                    width: 50,
                    height: 100,
                    child:
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSettings()),);
                      },
                      child:
                      const Icon(Icons.call_rounded,
                        size: 30,
                        color: Color(0xFFCF9FFF),),
                    ),
                  ),

                  Container(
                    width: 50,
                    height: 100,
                    child:
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSettings()),);
                      },
                      child:
                      const Icon(Icons.video_call_rounded,
                        size: 40,
                        color: Color(0xFFCF9FFF),),
                    ),
                  ),
                ],

              ),

              Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    child:
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0), //or 15.0
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        height: 80.0,
                        width: 80.0,
                        color: Colors.transparent,
                        child: Image.network(
                          'https://blogger.googleusercontent.com/img/a/AVvXsEjA3yU3DQvoZfKBHzkcIumfUyxaUYDVVWSQcu5ikh8PW_UQx_wxTNivemQn1MY1TsjvFVDesueMPmTk-FWnYErepqHjvi9Ni4hSTvhlNfFIBsOLYjCnfq4sxeTkVNPjm7GApYXQSRd3Bwe7I06FqWu8Ja2W7VM7nsJf-ZwO59ckAJvjD2_cI0TjEwVE=s895',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(top: 40.0),
                    width: 150,
                    height: 100,
                    child: const Text('Anne Marie', style: TextStyle(
                      fontSize: 15,

                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sans-serif',),),
                  ),

                  Container(
                    width: 50,
                    height: 100,
                    child:
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSettings()),);
                      },
                      child:
                      const Icon(Icons.message_rounded,
                        size: 30,
                        color: Color(0xFFCF9FFF),),
                    ),
                  ),

                  Container(
                    width: 50,
                    height: 100,
                    child:
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSettings()),);
                      },
                      child:
                      const Icon(Icons.call_rounded,
                        size: 30,
                        color: Color(0xFFCF9FFF),),
                    ),
                  ),

                  Container(
                    width: 50,
                    height: 100,
                    child:
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSettings()),);
                      },
                      child:
                      const Icon(Icons.video_call_rounded,
                        size: 40,
                        color: Color(0xFFCF9FFF),),
                    ),
                  ),
                ],

              ),

              Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    child:
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0), //or 15.0
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        height: 80.0,
                        width: 80.0,
                        color: Colors.transparent,
                        child: Image.network(
                          'https://blogger.googleusercontent.com/img/a/AVvXsEjA3yU3DQvoZfKBHzkcIumfUyxaUYDVVWSQcu5ikh8PW_UQx_wxTNivemQn1MY1TsjvFVDesueMPmTk-FWnYErepqHjvi9Ni4hSTvhlNfFIBsOLYjCnfq4sxeTkVNPjm7GApYXQSRd3Bwe7I06FqWu8Ja2W7VM7nsJf-ZwO59ckAJvjD2_cI0TjEwVE=s895',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(top: 40.0),
                    width: 150,
                    height: 100,
                    child: const Text('Anne Marie', style: TextStyle(
                      fontSize: 15,

                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sans-serif',),),
                  ),

                  Container(
                    width: 50,
                    height: 100,
                    child:
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSettings()),);
                      },
                      child:
                      const Icon(Icons.message_rounded,
                        size: 30,
                        color: Color(0xFFCF9FFF),),
                    ),
                  ),

                  Container(
                    width: 50,
                    height: 100,
                    child:
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSettings()),);
                      },
                      child:
                      const Icon(Icons.call_rounded,
                        size: 30,
                        color: Color(0xFFCF9FFF),),
                    ),
                  ),

                  Container(
                    width: 50,
                    height: 100,
                    child:
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSettings()),);
                      },
                      child:
                      const Icon(Icons.video_call_rounded,
                        size: 40,
                        color: Color(0xFFCF9FFF),),
                    ),
                  ),
                ],

              ),

              Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    child:
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0), //or 15.0
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        height: 80.0,
                        width: 80.0,
                        color: Colors.transparent,
                        child: Image.network(
                          'https://blogger.googleusercontent.com/img/a/AVvXsEjA3yU3DQvoZfKBHzkcIumfUyxaUYDVVWSQcu5ikh8PW_UQx_wxTNivemQn1MY1TsjvFVDesueMPmTk-FWnYErepqHjvi9Ni4hSTvhlNfFIBsOLYjCnfq4sxeTkVNPjm7GApYXQSRd3Bwe7I06FqWu8Ja2W7VM7nsJf-ZwO59ckAJvjD2_cI0TjEwVE=s895',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(top: 40.0),
                    width: 150,
                    height: 100,
                    child: const Text('Anne Marie', style: TextStyle(
                      fontSize: 15,

                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sans-serif',),),
                  ),

                  Container(
                    width: 50,
                    height: 100,
                    child:
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSettings()),);
                      },
                      child:
                      const Icon(Icons.message_rounded,
                        size: 30,
                        color: Color(0xFFCF9FFF),),
                    ),
                  ),

                  Container(
                    width: 50,
                    height: 100,
                    child:
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSettings()),);
                      },
                      child:
                      const Icon(Icons.call_rounded,
                        size: 30,
                        color: Color(0xFFCF9FFF),),
                    ),
                  ),

                  Container(
                    width: 50,
                    height: 100,
                    child:
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSettings()),);
                      },
                      child:
                      const Icon(Icons.video_call_rounded,
                        size: 40,
                        color: Color(0xFFCF9FFF),),
                    ),
                  ),
                ],

              ),







            ]),
      ),
    );
  }
}


