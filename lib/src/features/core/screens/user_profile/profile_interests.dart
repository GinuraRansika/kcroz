import 'package:flutter/material.dart';
import 'package:kcroz/src/features/core/screens/user_profile/user_profile_screen.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'profile_bio.dart';
import 'profile_interests.dart';
import 'profile_settings.dart';
import 'additional_step.dart';
import 'package:provider/provider.dart';

import '../../../../constants/text_string.dart';

class ProfileInterests extends StatelessWidget {
  ProfileInterests({Key? key}) : super(key: key);
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox.fromSize(size: Size(0, 50)),
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0), //or 15.0
                child: Container(
                  height: 150.0,
                  width: 150.0,
                  color: Color(0xFF966FD6),
                  child: Image.network(
                    'https://blogger.googleusercontent.com/img/a/AVvXsEjA3yU3DQvoZfKBHzkcIumfUyxaUYDVVWSQcu5ikh8PW_UQx_wxTNivemQn1MY1TsjvFVDesueMPmTk-FWnYErepqHjvi9Ni4hSTvhlNfFIBsOLYjCnfq4sxeTkVNPjm7GApYXQSRd3Bwe7I06FqWu8Ja2W7VM7nsJf-ZwO59ckAJvjD2_cI0TjEwVE=s895',
                    fit: BoxFit.cover,
                  ),
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
                    SizedBox(width: 0,),
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AdditionalStep()),);
                      },
                      child:

                      const Icon(LineAwesomeIcons.camera,
                        size: 30,
                        color: Color(0xFFCF9FFF),
                      ),
                    ),

                    SizedBox(width: 20,),
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileBio()),);
                      },
                      child:
                      const Icon(LineAwesomeIcons.user_circle,

                        size: 30,
                        color: Color(0xFFCF9FFF),
                      ),
                    ),

                    SizedBox(width: 20,),
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileInterests()),);
                      },
                      child:

                      const Icon(LineAwesomeIcons.heart,
                        size: 30,
                        color: Color(0xFF966FD6),),
                    ),

                    SizedBox(width: 20,),
                    GestureDetector(
                      key: null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSettings()),);
                      },
                      child:
                      const Icon(Icons.settings,
                        size: 30,
                        color: Color(0xFFCF9FFF),),
                    ),

                  ]),
            ]));
  }
}


