import 'package:flutter/material.dart';
import 'package:kcroz/src/features/core/screens/profile/profile_bio.dart';
import 'package:kcroz/src/features/core/screens/profile/profile_interest.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';


class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

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
                        onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context)=>ProfileBio()));
                          // FirebaseAuthMethods().deleteAccount(context);
                        },
                        icon: const Icon(
                          LineAwesomeIcons.user_circle,
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
                          LineAwesomeIcons.heart,
                          size: 30,
                        ),
                        color: const Color(0xFF966FD6),
                      ),
                    ]),


                Padding(
                    padding: const EdgeInsets.all(24),
                    child: GridA())  ]),
        )
    );
  }
}

// ignore: must_be_immutable
class GridA extends StatelessWidget {
  // const GridA({Key? key}) : super(key: key);
  List<String> imagessList=[
    'https://images.unsplash.com/photo-1469474968028-56623f02e42e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bmF0dXJlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60',
    'https://plus.unsplash.com/premium_photo-1664361480561-3bdcd6eb3b6f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bmF0dXJlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60',
    'https://images.unsplash.com/photo-1472214103451-9374bd1c798e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
    'https://images.unsplash.com/photo-1517999179346-a7078f1e40a6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGFzc2V0c3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60',
    'https://images.unsplash.com/photo-1488229297570-58520851e868?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGFzc2V0c3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60',
    'https://images.unsplash.com/photo-1552664730-d307ca884978?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGFzc2V0c3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60',
    'https://plus.unsplash.com/premium_photo-1669741908308-5ca216f3fcd1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60',
    'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHBlcnNvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60',

  ];

  GridA({super.key});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 5,mainAxisSpacing: 5),
        itemCount:8,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0),
              image: DecorationImage(
                image: NetworkImage(imagessList[index]),
                fit: BoxFit.cover,))
              );
        }
    );
  }
}
