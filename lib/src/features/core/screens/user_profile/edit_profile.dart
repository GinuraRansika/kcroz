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
import 'additional_step.dart';

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

  final TextEditingController _textEditingController = TextEditingController();

  final List<Uint8List> _imageList = [];
  Uint8List? _profilePic;


  void selectProfilePic() async{
    Uint8List image = await pickImage(ImageSource.gallery);
    setState(() {
      _profilePic = image;
    });
  }

  String _userName = 'Anne Marie';
  String _firstName = 'Anne';
  String _lastName = 'Marie';



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

        body: Column(
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
              const Text(
                "Anne Marie",
                style: TextStyle(
                    fontSize: 16.0,
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w400,
                    fontFamily: "Poppins"),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
              ),


              Center(
                child: GestureDetector(
                  onTap: () {
                    // When the text is tapped, set the editing controller's value to the current text value
                    _textEditingController.text = _userName;
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: EditableText(
                      controller: _textEditingController,
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


              Center(
                child: GestureDetector(
                  onTap: () {
                    // When the text is tapped, set the editing controller's value to the current text value
                    // _textEditingController.text = _firstName;
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: EditableText(
                      controller: _textEditingController,
                      focusNode: FocusNode(),
                      style: const TextStyle(fontSize: 16.0,
                          color: Colors.black),
                      cursorColor: Colors.blue,
                      backgroundCursorColor: Colors.grey,
                      onChanged: (value) {
                        setState(() {
                          _firstName = value;
                        });
                      },
                    ),
                  ),
                ),
              ),


              Center(
                child: GestureDetector(
                  onTap: () {
                    // When the text is tapped, set the editing controller's value to the current text value
                    // _textEditingController.text = _lastName;
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: EditableText(
                      controller: _textEditingController,
                      focusNode: FocusNode(),
                      style: const TextStyle(fontSize: 16.0,
                          color: Colors.black),
                      cursorColor: Colors.blue,
                      backgroundCursorColor: Colors.grey,
                      onChanged: (value) {
                        setState(() {
                          _lastName = value;
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


            ])
    );
  }

  void setState(Null Function() param0) {}
}


