import 'dart:async';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kcroz/src/features/core/screens/navigation_page.dart';
import 'package:kcroz/src/services/firebase_auth_methods.dart';

import '../../../../../constants/image_string.dart';
import '../../../../../utils/utils.dart';

class AdditionalStep extends StatefulWidget {
  const AdditionalStep({Key? key}) : super(key: key);


  @override
  State<AdditionalStep> createState() => _AdditionalStepState();
}

class _AdditionalStepState extends State<AdditionalStep> {
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  late Position _currentPosition;
  final Geolocator _geolocator = Geolocator();

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    // Update the user's location every minute
    Timer.periodic(Duration(minutes: 1), (Timer t) => _updateUserLocation());
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _positionStreamSubscription?.cancel();
  // }

  void _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      _currentPosition = position;
    });
  }

  // void _startLocationUpdates() {
  //   _positionStreamSubscription =
  //       Geolocator.getPositionStream(intervalDuration: const Duration(minutes: 1)).listen((position) {
  //         setState(() {
  //           _position = position;
  //         });
  //         _updateUserLocation();
  //       });
  // }

  void _updateUserLocation() {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null && _currentPosition != null) {
      FirebaseFirestore.instance.collection('users').doc(userId).update({
        'latitude': _currentPosition!.latitude,
        'longitude': _currentPosition!.longitude,
        'timestamp': FieldValue.serverTimestamp(),
      });
    }
  }

  // @override
  // Widget build(BuildContext context) {
  //   // TODO: implement build
  //   throw UnimplementedError();
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           if (_position != null)
  //             Text('Current location: ${_position!.latitude}, ${_position!.longitude}'),
  //           const SizedBox(height: 16),
  //           ElevatedButton(
  //             onPressed: _getCurrentLocation,
  //             child: const Text('Get Current Location'),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  final List<Uint8List> _imageList = [];
  Uint8List? _feedImage01;
  Uint8List? _feedImage02;
  Uint8List? _feedImage03;
  Uint8List? _feedImage04;

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
      body: SizedBox(
        height: double.infinity,
        child: Center(
          child: Column(
              children: [
                SizedBox(height: 50,),
                Text("Add More Photos",style: Theme.of(context).textTheme.headline1,),
                SizedBox(height: 50,),
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
        ),
      ),
    );;
  }
}
