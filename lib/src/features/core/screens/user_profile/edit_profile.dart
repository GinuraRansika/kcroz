import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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

class EditProfile extends StatelessWidget {
  EditProfile({Key? key}) : super(key: key);
  final List<ImageProvider> _imageProviders = [
    Image.network(
        "https://i12.haber7.net//haber/haber7/og_image/2022/22/hande_ercelden_sert_cikis_kadinlara_yuklenmeyin_1654068467_3687.jpg")
        .image,
    Image.network(
        "https://los40es00.epimg.net/los40/imagenes/2021/08/11/cinetv/1628672548_463726_1628675121_noticia_normal_amp.jpg")
        .image,
    Image.network(
        "https://www.chafarderias.com/uploads/s1/17/08/69/hande-ercel.jpeg")
        .image,
    Image.network(
        "https://nubiapage.com/wp-content/uploads/cbfd5a971ff66f9e0439eaf447227aff-1-531x744.jpg")
        .image
  ];



  final List<Uint8List> _imageList = [];
  Uint8List? _profilePic;


  void selectProfilePic() async{
    Uint8List image = await pickImage(ImageSource.gallery);
    setState(() {
      _profilePic = image;
    });
  }

  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _religionController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _homeTownController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();
  final TextEditingController _universityController = TextEditingController();
  final TextEditingController _collegeController = TextEditingController();
  final TextEditingController _dietController = TextEditingController();
  final TextEditingController _smokeController = TextEditingController();
  final TextEditingController _drinkController = TextEditingController();


  String _bio = 'singer, songwriter, and actress. She is noted for her four-octave vocal range and '
      'her signature use of the whistle register, '
      'which have received critical acclaim by critics and media';
  String _userName = 'Hayat Uzun';
  String _age = '30';
  String _religion = 'Buddhism';
  String _birthday = 'Buddhism';
  String _homeTown = 'Buddhism';
  String _occupation = 'Buddhism';
  String _university = 'Buddhism';
  String _college = 'Buddhism';
  String _diet = 'Buddhism';
  String _smoke = 'Buddhism';
  String _drink = 'Buddhism';






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
          title: Text('Edit Profile', style: Theme.of(context).textTheme.headline4,),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.edit))
          ],

        ),

        body: SingleChildScrollView(
          child: Center(
            child:
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox.fromSize(size: Size(0, 50)),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0), //or 15.0
                    child: Stack(
                      children: [
                        Container(
                          height: 150.0,
                          width: 150.0,
                          color: Color(0xFF966FD6),
                          child: Image.network(
                            'https://blogger.googleusercontent.com/img/a/AVvXsEjA3yU3DQvoZfKBHzkcIumfUyxaUYDVVWSQcu5ikh8PW_UQx_wxTNivemQn1MY1TsjvFVDesueMPmTk-FWnYErepqHjvi9Ni4hSTvhlNfFIBsOLYjCnfq4sxeTkVNPjm7GApYXQSRd3Bwe7I06FqWu8Ja2W7VM7nsJf-ZwO59ckAJvjD2_cI0TjEwVE=s895',
                            fit: BoxFit.cover,
                          ),
                        ),

                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              // border: Border.all(
                              //   width: 4,
                              //   color: Colors.white
                              // ),
                              color: Color(0xFFCF9FFF),
                            ),
                            child: IconButton(
                              onPressed: (){
                                selectProfilePic();
                              },
                              icon: const Icon(Icons.edit,color: Colors.white,),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox.fromSize(size: Size(10, 10)),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),


                  Row(
                    children: const [
                      Icon(Icons.nightlife_rounded),
                      SizedBox(width: 10),
                      Text('Bio:',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Sans-serif',),),
                    ],
                  ),

                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // When the text is tapped, set the editing controller's value to the current text value
                        _bioController.text = _bio;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: EditableText(
                          controller: _bioController,
                          focusNode: FocusNode(),
                          style: const TextStyle(fontSize: 16.0,
                              color: Colors.black),
                          cursorColor: Colors.blue,
                          backgroundCursorColor: Colors.grey,
                          onChanged: (value) {
                            setState(() {
                              _bio = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),


                  Row(
                    children: const [
                      Icon(Icons.account_circle),
                      SizedBox(width: 10),
                      Text('User Name:',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Sans-serif',),),
                    ],
                  ),

                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // When the text is tapped, set the editing controller's value to the current text value
                        _userNameController.text = _userName;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: EditableText(
                          controller: _userNameController,
                          focusNode: FocusNode(),
                          style: const TextStyle(fontSize: 16.0,
                              color: Colors.black),
                          cursorColor: Colors.blue,
                          backgroundCursorColor: Colors.grey,
                          onChanged: (value) {
                            setState(() {
                              _userName = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),


                  Row(
                    children: const [
                      Icon(Icons.calendar_month_rounded),
                      SizedBox(width: 10),
                      Text('Age:',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Sans-serif',),),
                    ],
                  ),

                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // When the text is tapped, set the editing controller's value to the current text value
                        _ageController.text = _age;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: EditableText(
                          controller: _ageController,
                          focusNode: FocusNode(),
                          style: const TextStyle(fontSize: 16.0,
                              color: Colors.black),
                          cursorColor: Colors.blue,
                          backgroundCursorColor: Colors.grey,
                          onChanged: (value) {
                            setState(() {
                              _age = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),


                  Row(
                    children: const [
                      Icon(Icons.temple_buddhist_rounded),
                      SizedBox(width: 10),
                      Text('Religion:',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Sans-serif',),),
                    ],
                  ),

                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // When the text is tapped, set the editing controller's value to the current text value
                        _religionController.text = _religion;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: EditableText(
                          controller: _religionController,
                          focusNode: FocusNode(),
                          style: const TextStyle(fontSize: 16.0,
                              color: Colors.black),
                          cursorColor: Colors.blue,
                          backgroundCursorColor: Colors.grey,
                          onChanged: (value) {
                            setState(() {
                              _religion = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),


                  Row(
                    children: const [
                      Icon(Icons.celebration_rounded),
                      SizedBox(width: 10),
                      Text('Birthday:',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Sans-serif',),),
                    ],
                  ),

                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // When the text is tapped, set the editing controller's value to the current text value
                        _birthdayController.text = _birthday;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: EditableText(
                          controller: _birthdayController,
                          focusNode: FocusNode(),
                          style: const TextStyle(fontSize: 16.0,
                              color: Colors.black),
                          cursorColor: Colors.blue,
                          backgroundCursorColor: Colors.grey,
                          onChanged: (value) {
                            setState(() {
                              _birthday = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),


                  Row(
                    children: const [
                      Icon(Icons.home_rounded),
                      SizedBox(width: 10),
                      Text('Home Town :',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Sans-serif',),),
                    ],
                  ),

                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // When the text is tapped, set the editing controller's value to the current text value
                        _homeTownController.text = _homeTown ;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: EditableText(
                          controller: _homeTownController,
                          focusNode: FocusNode(),
                          style: const TextStyle(fontSize: 16.0,
                              color: Colors.black),
                          cursorColor: Colors.blue,
                          backgroundCursorColor: Colors.grey,
                          onChanged: (value) {
                            setState(() {
                              _homeTown  = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),


                  Row(
                    children: const [
                      Icon(Icons.sensor_occupied_rounded),
                      SizedBox(width: 10),
                      Text('Occupation:',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Sans-serif',),),
                    ],
                  ),

                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // When the text is tapped, set the editing controller's value to the current text value
                        _occupationController.text = _occupation;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: EditableText(
                          controller: _occupationController,
                          focusNode: FocusNode(),
                          style: const TextStyle(fontSize: 16.0,
                              color: Colors.black),
                          cursorColor: Colors.blue,
                          backgroundCursorColor: Colors.grey,
                          onChanged: (value) {
                            setState(() {
                              _occupation = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),


                  Row(
                    children: const [
                      Icon(Icons.cast_for_education_rounded),
                      SizedBox(width: 10),
                      Text('University:',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Sans-serif',),),
                    ],
                  ),

                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // When the text is tapped, set the editing controller's value to the current text value
                        _universityController.text = _university;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: EditableText(
                          controller: _universityController,
                          focusNode: FocusNode(),
                          style: const TextStyle(fontSize: 16.0,
                              color: Colors.black),
                          cursorColor: Colors.blue,
                          backgroundCursorColor: Colors.grey,
                          onChanged: (value) {
                            setState(() {
                              _university = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),


                  Row(
                    children: const [
                      Icon(Icons.grading_rounded),
                      SizedBox(width: 10),
                      Text('College:',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Sans-serif',),),
                    ],
                  ),

                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // When the text is tapped, set the editing controller's value to the current text value
                        _collegeController.text = _college;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: EditableText(
                          controller: _collegeController,
                          focusNode: FocusNode(),
                          style: const TextStyle(fontSize: 16.0,
                              color: Colors.black),
                          cursorColor: Colors.blue,
                          backgroundCursorColor: Colors.grey,
                          onChanged: (value) {
                            setState(() {
                              _college = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),


                  Row(
                    children: const [
                      Icon(Icons.no_food_rounded),
                      SizedBox(width: 10),
                      Text('Diet:',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Sans-serif',),),
                    ],
                  ),

                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // When the text is tapped, set the editing controller's value to the current text value
                        _dietController.text = _diet;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: EditableText(
                          controller: _dietController,
                          focusNode: FocusNode(),
                          style: const TextStyle(fontSize: 16.0,
                              color: Colors.black),
                          cursorColor: Colors.blue,
                          backgroundCursorColor: Colors.grey,
                          onChanged: (value) {
                            setState(() {
                              _diet = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),


                  Row(
                    children: const [
                      Icon(Icons.smoking_rooms_rounded),
                      SizedBox(width: 10),
                      Text('Smoke:',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Sans-serif',),),
                    ],
                  ),

                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // When the text is tapped, set the editing controller's value to the current text value
                        _smokeController.text = _smoke;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: EditableText(
                          controller: _smokeController,
                          focusNode: FocusNode(),
                          style: const TextStyle(fontSize: 16.0,
                              color: Colors.black),
                          cursorColor: Colors.blue,
                          backgroundCursorColor: Colors.grey,
                          onChanged: (value) {
                            setState(() {
                              _smoke = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),


                  Row(
                    children: const [
                      Icon(Icons.no_drinks_rounded),
                      SizedBox(width: 10),
                      Text('Drink:',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Sans-serif',),),
                    ],
                  ),

                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // When the text is tapped, set the editing controller's value to the current text value
                        _drinkController.text = _drink;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: EditableText(
                          controller: _drinkController,
                          focusNode: FocusNode(),
                          style: const TextStyle(fontSize: 16.0,
                              color: Colors.black),
                          cursorColor: Colors.blue,
                          backgroundCursorColor: Colors.grey,
                          onChanged: (value) {
                            setState(() {
                              _drink = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),





                  // Padding(
                  //   padding: const EdgeInsets.all(16.0),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: <Widget>[
                  //       // Text('Title:'),
                  //       TextFormField(
                  //         decoration: const InputDecoration(
                  //           hintText: 'Edit Your Name',
                  //           labelText: 'Anne Marie',
                  //         ),
                  //         onChanged: (value) {
                  //           setState(() {
                  //             _textValue = value;
                  //           });
                  //         },
                  //       ),
                  //     ],
                  //   ),)


                ]),
          ),
        ),
    );
  }

  void setState(Null Function() param0) {}
}


