import 'package:flutter/material.dart';
import 'package:kcroz/src/features/core/screens/profile/profile_interest.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';


class ProfileBio extends StatelessWidget {
  ProfileBio({Key? key}) : super(key: key);

  final List<String> assetNames = [
    'https://burst.shopifycdn.com/photos/fog-on-dark-waters-edge.jpg?width=1200&format=pjpg&exif=1&iptc=1',
    'https://cdn.pixabay.com/photo/2018/08/14/13/23/ocean-3605547__480.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox.fromSize(size: const Size(0, 50)),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0), //or 15.0
                  child: Container(
                    height: 150.0,
                    width: 150.0,
                    color: const Color(0xffFF0E58),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox.fromSize(size: const Size(10, 10)),
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
                                    "15%\nMatching",
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
                      IconButton(
                        key: null,
                        onPressed: () {
                          // FirebaseAuthMethods().deleteAccount(context);
                        },
                        icon: const Icon(
                          LineAwesomeIcons.user_circle, //info-bio
                          size: 30,
                        ),
                        color: const Color(0xFF966FD6),
                      ),
                      TextButton(
                          key: null,
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color(0xFF966FD6)),
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.symmetric(horizontal: 30.0)),
                              shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: const BorderSide(color: Color(0xFF966FD6)),
                                  ))),
                          child: const Text(
                            "Connect",
                            style: TextStyle(
                                letterSpacing: 1.5,
                                fontSize: 15.0,
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w400,
                                fontFamily: "Poppins"),
                          )),
                      IconButton(
                        key: null,
                        onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context)=>UserInterest()));
    // FirebaseAuthMethods().signOut(context);
                        },
                        icon: const Icon(
                          LineAwesomeIcons.heart, //interest
                          size: 30,
                        ),
                        color: const Color(0xFF966FD6),
                      ),
                    ]),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        '100% Italian, fun loving, affectionate young lady who knows what it takes to mako a rolationshio work.',
                        style: TextStyle(fontSize: 17),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'INFO',
                        style: TextStyle(fontSize: 17),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'Age 30 \n '
                            'Birthday  Buddhist\n'
                            'HomeTown  Maradhana\n'
                            'Occupation  Software Engineer\n'
                            'University  IIT\n'
                            'College  Visaka College\n'
                          'Diet  Vegan \n '
                              'Smoke  No \n'
                              'Drink  No\n',
                        style: TextStyle(fontSize: 17),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ]),
        )
    );
  }
}


