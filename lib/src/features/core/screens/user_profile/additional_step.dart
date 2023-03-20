import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kcroz/src/features/core/screens/navigation_page.dart';
import 'package:kcroz/src/services/firebase_auth_methods.dart';

import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../../../constants/image_string.dart';
import '../../../../utils/utils.dart';
import 'profile_bio.dart';
import 'profile_interests.dart';
import 'profile_settings.dart';

import '../../../../../constants/image_string.dart';
import '../../../../../utils/utils.dart';

class AdditionalStep extends StatefulWidget {
  AdditionalStep({Key? key}) : super(key: key);


  @override
  State<AdditionalStep> createState() => _AdditionalStepState();


  // final List<ImageProvider> _imageProviders = [
  //   Image.network(
  //       "https://i12.haber7.net//haber/haber7/og_image/2022/22/hande_ercelden_sert_cikis_kadinlara_yuklenmeyin_1654068467_3687.jpg")
  //       .image,
  //   Image.network(
  //       "https://los40es00.epimg.net/los40/imagenes/2021/08/11/cinetv/1628672548_463726_1628675121_noticia_normal_amp.jpg")
  //       .image,
  //   Image.network(
  //       "https://www.chafarderias.com/uploads/s1/17/08/69/hande-ercel.jpeg")
  //       .image,
  //   Image.network(
  //       "https://nubiapage.com/wp-content/uploads/cbfd5a971ff66f9e0439eaf447227aff-1-531x744.jpg")
  //       .image
  // ];

}


class _AdditionalStepState extends State<AdditionalStep> {
  final List<Uint8List> _imageList = [];
  Uint8List? _profilePic;
  Uint8List? _feedImage01;
  Uint8List? _feedImage02;
  Uint8List? _feedImage03;
  Uint8List? _feedImage04;

  void selectProfilePic() async{
    Uint8List image = await pickImage(ImageSource.gallery);
    setState(() {
      _profilePic = image;
    });
  }

  void selectFeedImage01() async {
    Uint8List image = await pickImage(ImageSource.gallery);
    setState(() {
      _feedImage01 = image;
    });
  }

  void selectFeedImage02() async {
    Uint8List image = await pickImage(ImageSource.gallery);
    setState(() {
      _feedImage02 = image;
    });
  }

  void selectFeedImage03() async {
    Uint8List image = await pickImage(ImageSource.gallery);
    setState(() {
      _feedImage03 = image;
    });
  }

  void selectFeedImage04() async {
    Uint8List image = await pickImage(ImageSource.gallery);
    setState(() {
      _feedImage04 = image;
    });
  }

  void saveImages() async {
    FirebaseAuthMethods().addFeedImages(
        feedImage01: _feedImage01!,
        feedImage02: _feedImage02!,
        feedImage03: _feedImage03!,
        feedImage04: _feedImage04!);
    Get.to(() => const NavigationPage());
  }


  Widget getImage(double width) {
    if(_imageList.length == 0){
      return Image(
          width: width * 0.45,
          height: 220,
          fit: BoxFit.cover,
          image: AssetImage(kcrozDefaultProfileImage)
      );
    } else{
      return Image(
          width: width * 0.45,
          height: 220,
          fit: BoxFit.cover,
          image: AssetImage(kcrozOnBoardingImage1)
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        // height: double.infinity,
        child: Center(
          child: Column(
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
                        top: 100,
                          left: 100,
                          child: IconButton(
                            onPressed: () {
                              selectProfilePic();
                            },
                            icon: const Icon(
                              Icons.add_circle_outlined,
                              size: 30,
                            ),
                          )
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              TextButton(
                                  key: null,
                                  onPressed: () {},
                                  child: const Text(
                                    "15\nConnections",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Color(0xFF717171),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Poppins"),
                                  )),
                              const VerticalDivider(
                                color: Color(0xFF949494),
                                thickness: 1,
                                indent: 12,
                                endIndent: 10,
                              ),
                              TextButton(
                                  key: null,
                                  onPressed: () {},
                                  child: const Text(
                                    "2\nRequests",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Color(0xFF717171),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Poppins"),
                                  )),
                            ],
                          )),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        key: null,
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AdditionalStep()),);
                        },
                        child: const Icon(LineAwesomeIcons.camera,
                          size: 30,
                          color: Color(0xFF966FD6),

                        ),

                      ),

                      GestureDetector(
                        key: null,
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileBio()),);
                        },
                        child: const Icon(LineAwesomeIcons.user_circle,
                          size: 30,
                          color: Color(0xFFCF9FFF),),
                      ),

                      GestureDetector(
                        key: null,
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileInterests()),);
                        },
                        child: const Icon(LineAwesomeIcons.heart,
                          size: 30,
                          color: Color(0xFFCF9FFF),),
                      ),

                      GestureDetector(
                        key: null,
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSettings()),);
                        },
                        child: const Icon(LineAwesomeIcons.tools,
                          size: 30,
                          color: Color(0xFFCF9FFF),),
                      ),

                    ]),
                Column(


                    children: [
                      SizedBox(height: 20,),
                      Container(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(32),
                                        child: _feedImage01 == null ? Image(
                                            width: width * 0.45,
                                            height: 320,
                                            fit: BoxFit.cover,
                                            image: const AssetImage(kcrozOnBoardingImage1)
                                        ):
                                        Image(
                                            width: width * 0.45,
                                            height: 320,
                                            fit: BoxFit.cover,
                                            image: MemoryImage(_feedImage01!)
                                        )                                                  ,
                                      ),
                                    ),
                                    Positioned(
                                        bottom: -10,
                                        left: width * 0.38,
                                        child: IconButton(
                                          onPressed: () {
                                            selectFeedImage01();
                                          },
                                          icon: const Icon(
                                            Icons.add_circle_outlined,
                                            size: 30,
                                          ),
                                        )
                                    ),
                                  ],
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(32),
                                          child: _feedImage03 == null ? Image(
                                              width: width * 0.45,
                                              height: 220,
                                              fit: BoxFit.cover,
                                              image: const AssetImage(kcrozOnBoardingImage1)
                                          ):
                                          Image(
                                              width: width * 0.45,
                                              height: 220,
                                              fit: BoxFit.cover,
                                              image: MemoryImage(_feedImage03!)
                                          )
                                      ),
                                    ),
                                    Positioned(
                                        bottom: -10,
                                        left: width * 0.38,
                                        child: IconButton(
                                          onPressed: () {
                                            selectFeedImage03();
                                          },
                                          icon: const Icon(
                                            Icons.add_circle_outlined,
                                            size: 30,
                                          ),
                                        )),
                                  ],
                                ),
                              ],),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(32),
                                          child: _feedImage02 == null ? Image(
                                              width: width * 0.45,
                                              height: 220,
                                              fit: BoxFit.cover,
                                              image: const AssetImage(kcrozOnBoardingImage1)
                                          ):
                                          Image(
                                              width: width * 0.45,
                                              height: 220,
                                              fit: BoxFit.cover,
                                              image: MemoryImage(_feedImage02!)
                                          )
                                      ),
                                    ),
                                    Positioned(
                                        bottom: -10,
                                        left: width * 0.38,
                                        child: IconButton(
                                          onPressed: () {
                                            selectFeedImage02();
                                          },
                                          icon: const Icon(
                                            Icons.add_circle_outlined,
                                            size: 30,
                                          ),
                                        )),
                                  ],
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(32),
                                          child: _feedImage04 == null ? Image(
                                              width: width * 0.45,
                                              height: 320,
                                              fit: BoxFit.cover,
                                              image: const AssetImage(kcrozOnBoardingImage1)
                                          ):
                                          Image(
                                              width: width * 0.45,
                                              height: 320,
                                              fit: BoxFit.cover,
                                              image: MemoryImage(_feedImage04!)
                                          )
                                      ),
                                    ),
                                    Positioned(
                                        bottom: -10,
                                        left: width * 0.38,
                                        child: IconButton(
                                          onPressed: () {
                                            selectFeedImage04();
                                          },
                                          icon: const Icon(
                                            Icons.add_circle_outlined,
                                            size: 30,
                                          ),
                                        )),
                                  ],
                                ),
                              ],)
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Get.to(() => const NavigationPage());
                                  },
                                  child: Text("Skip"),
                                )
                            ),
                            const SizedBox(width: 10,),
                            Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    saveImages();
                                  },
                                  child: Text("Finished"),
                                )
                            ),
                          ],

                        ),
                      )
                    ]
                ),

              ]
          ),

        ),

      ),
    );;
  }
}
