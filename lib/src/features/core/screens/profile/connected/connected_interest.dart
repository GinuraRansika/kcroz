import 'package:flutter/material.dart';
import 'package:kcroz/src/features/core/screens/profile/connected/connected_bio.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';


class ConnectedUserInterest extends StatelessWidget {
  ConnectedUserInterest ({Key? key}) : super(key: key);

  final List<String> assetNames = [
    'https://burst.shopifycdn.com/photos/fog-on-dark-waters-edge.jpg?width=1200&format=pjpg&exif=1&iptc=1',
    'https://cdn.pixabay.com/photo/2018/08/14/13/23/ocean-3605547__480.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox.fromSize(size: const Size(0, 50)),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0), //or 15.0
                  child: Container(
                    height: 150.0,
                    width: 150.0,
                    color: const Color(0xffFF0E50),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlciUyMHByb2ZpbGV8ZW50MHx8MHx8&auto=format&fit=crop&w=800&q=60',
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
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>ConnectedProfileBio()));
                          // FirebaseAuthMethods().deleteAccount(context);
                        },
                        icon: const Icon(
                          LineAwesomeIcons.user_circle,
                          size: 30,
                        ),
                        color: const Color(0xFF966FD6),
                      ),
                      IconButton(
                        key: null,
                        onPressed: () {
                          // Navigator.push(context,MaterialPageRoute(builder: (context)=>ProfileBio()));
                          // FirebaseAuthMethods().deleteAccount(context);
                        },
                        icon: const Icon(
                          LineAwesomeIcons.phone,
                          size: 30,
                        ),
                        color: const Color(0xFF966FD6),
                      ),
                      IconButton(
                        key: null,
                        onPressed: () {
                          // Navigator.push(context,MaterialPageRoute(builder: (context)=>ProfileBio()));
                          // FirebaseAuthMethods().deleteAccount(context);
                        },
                        icon: const Icon(
                          LineAwesomeIcons.retro_camera,
                          size: 30,
                        ),
                        color: const Color(0xFF966FD6),
                      ),
                      IconButton(
                        key: null,
                        onPressed: () {
                          // Navigator.push(context,MaterialPageRoute(builder: (context)=>ProfileBio()));
                          // FirebaseAuthMethods().deleteAccount(context);
                        },
                        icon: const Icon(
                          LineAwesomeIcons.facebook_messenger,
                          size: 30,
                        ),
                        color: const Color(0xFF966FD6),
                      ),
                      IconButton(
                        key: null,
                        onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context)=>ConnectedUserInterest()));
                          // FirebaseAuthMethods().deleteAccount(context);
                        },
                        icon: const Icon(
                          LineAwesomeIcons.heart,
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
                  children: [

                    Container(
                      padding: const EdgeInsets.all(20),
                      child: const Text(
                        'INTERESTS',
                        style: TextStyle(
                            fontSize: 17),
                        textAlign: TextAlign.left,

                      ),
                    ),
                    const SizedBox(width: 30),
                    Column(
                      children: [

                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                          child: Row(

                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.purpleAccent,
                                    borderRadius: BorderRadius.circular(10),

                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Horror Movies',
                                      style: TextStyle(
                                        fontSize: 13,
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.cyan,

                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Cricket',
                                      style: TextStyle(
                                        fontSize: 13,
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.pink,
                                    borderRadius: BorderRadius.circular(10),

                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Dogs',
                                      style: TextStyle(
                                        fontSize: 13,
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.deepPurpleAccent,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Planting',
                                        style: TextStyle(
                                          fontSize: 13,
                                          // fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black45,
                                      borderRadius: BorderRadius.circular(10),

                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Coding',
                                        style: TextStyle(
                                          fontSize: 13,
                                          // fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.circular(10),

                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Badminton',
                                        style: TextStyle(
                                          fontSize: 13,
                                          // fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ]
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              ]),
        )
    );
  }
}


