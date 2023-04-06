import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../../authentication/screens/models/user_model.dart';

class OwnerProfileScreen extends StatefulWidget {
  final UserModel user;


  const OwnerProfileScreen({
        required this.user,
        Key? key}
      ) : super(key: key);

  @override
  State<OwnerProfileScreen> createState() => _OwnerProfileScreenState();
}

class _OwnerProfileScreenState extends State<OwnerProfileScreen> {
  bool isFeed = true;
  bool isInterests = false;
  bool isDetails = false;
  String feedImage01URL = "";
  String feedImage02URL = "";
  String feedImage03URL = "";
  String feedImage04URL = "";


  @override
  void initState() {
    super.initState();
    getFeedImages();
  }

  void getFeedImages() async {
    // snapshot of the current user's data from the firebase firestore database
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      feedImage01URL = (snapshot.data() as Map<String, dynamic>)['feedImage01URL'];
      feedImage02URL = (snapshot.data() as Map<String, dynamic>)['feedImage02URL'];
      feedImage03URL = (snapshot.data() as Map<String, dynamic>)['feedImage03URL'];
      feedImage04URL = (snapshot.data() as Map<String, dynamic>)['feedImage04URL'];
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox.fromSize(size: const Size(0, 10)),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0), //or 15.0
                    child: Container(
                      height: 140.0,
                      width: 140.0,
                      color: const Color(0xffFF0E58),
                      child: Image.network(
                          widget.user.dpURL,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox.fromSize(size: const Size(10, 10)),
                   Text(
                    widget.user.username,
                    style: const TextStyle(
                        fontSize: 18.0,
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.w900,
                        fontFamily: "Poppins"),
                  ),
                  SizedBox.fromSize(size: const Size(10, 10)),
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
                                    child: Text(
                                      "${widget.user.followers.length.toString()}\nConnections",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
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
                                      "75%\nMatching",
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
                  SizedBox.fromSize(size: const Size(10, 10)),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          key: null,
                          onPressed: () {
                            if(isDetails){
                              setState(() {
                                isFeed = true;
                                isInterests = false;
                                isDetails = false;
                              });
                            }else{
                              setState(() {
                                isFeed = false;
                                isInterests = false;
                                isDetails = true;
                              });
                            }
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
                              "Edit Profile",
                              style: TextStyle(
                                  letterSpacing: 1.5,
                                  fontSize: 15.0,
                                  color: Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Poppins"),
                            )),
                        IconButton(
                          key: null,
                          onPressed: () {
                            if(isInterests){
                              setState(() {
                                isFeed = true;
                                isInterests = false;
                                isDetails = false;
                              });
                            }else{
                              setState(() {
                                isFeed = false;
                                isInterests = true;
                                isDetails = false;
                              });
                            }
                          },
                          icon: const Icon(
                            LineAwesomeIcons.heart,
                            size: 30,
                          ),
                          color: const Color(0xFF966FD6),
                        ),
                      ]),
                  body(width),
                ]
            ),
          )
      ),
    );
  }

  body(width) {
    if(isFeed){
      return  Padding(
        padding: const EdgeInsets.fromLTRB(8, 20, 8, 0),
        child: Container(
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
                          child: SizedBox(
                              width: width * 0.43,
                              height: 200,
                              child: Image.network(
                                fit: BoxFit.cover,
                                feedImage01URL,
                                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value: loadingProgress.expectedTotalBytes != null
                                          ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                                    ),
                                  );
                                },
                              )
                          )                                                 ,
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(32),
                            child:  SizedBox(
                                width: width * 0.43,
                                height: 150,
                                child: Image.network(
                                  fit: BoxFit.cover,
                                  feedImage03URL,
                                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress.expectedTotalBytes != null
                                            ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                                      ),
                                    );
                                  },
                                )
                            )
                        ),
                      ),
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
                            child:  SizedBox(
                                width: width * 0.43,
                                height: 150,
                                child: Image.network(
                                  fit: BoxFit.cover,
                                  feedImage02URL,
                                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress.expectedTotalBytes != null
                                            ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                                      ),
                                    );
                                  },
                                )
                            )
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(32),
                            child: SizedBox(
                              width: width * 0.43,
                              height: 200,
                              child: Image.network(
                                fit: BoxFit.cover,
                                feedImage04URL,
                                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value: loadingProgress.expectedTotalBytes != null
                                          ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                                    ),
                                  );
                                },
                              )
                            )
                        ),
                      ),
                    ],
                  ),
                ],)
            ],
          ),
        ),
      );
    } else if(isDetails){
      return Padding(
          padding: EdgeInsets.all(10),
        child: Column(
          children: [
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
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
              children: [
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'INFO',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    'Age 30 \n '
                        'Birthday  ${widget.user.birthday}\n'
                        'Religion   ${widget.user.religion}\n'
                        'Occupation  ${widget.user.occupation}\n'
                        'University   ${widget.user.university}\n'
                        'College   ${widget.user.college}\n'
                        'Vegan   ${widget.user.vegan} \n '
                        'Smoke   ${widget.user.smoke} \n'
                        'Drink   ${widget.user.drink}\n',
                    style: const TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    } else{
      return Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: [
            const SizedBox(height: 40,),
            const Text(
              'INTERESTS',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20,),
            GroupButton(
              options: GroupButtonOptions(
                  buttonHeight: 50,
                  unselectedColor: const Color(0xFF966FD6),
                  spacing: 10,
                  runSpacing: 10,
                  textPadding: const EdgeInsets.symmetric(horizontal: 20),
                  groupingType: GroupingType.wrap,
                  direction: Axis.horizontal,
                  borderRadius: BorderRadius.circular(25),
                  selectedTextStyle: const TextStyle(color: Colors.white),
                  unselectedTextStyle: const TextStyle(color: Colors.white)
              ),
              buttons: widget.user.interests,
              isRadio: false,
              onSelected: (index, isSelected, booleanValue){
                print("selected");
              },
            ),
          ],
        ),
      );
    }
  }
}


