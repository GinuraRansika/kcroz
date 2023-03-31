import 'dart:ui' as ui;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kcroz/src/features/core/screens/map/home_page.dart';
import 'package:kcroz/src/features/core/screens/map/geo_locator_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class check_n_scan extends StatefulWidget {
  const check_n_scan({super.key});

  @override
  State<check_n_scan> createState() => _check_n_scanState();
}

class _check_n_scanState extends State<check_n_scan> {

  // double markerPosX = -2;
  // double markerPosY = 1;
  // @override
  // void initState() {
  //   super.initState();
  //   // Call your function here
  //   radiusRange(6.86235, 79.877302, 6.86253, 79.877321);
  // }
  double latitude = 0.00;
  double longtitude = 0.00;
  var altitude = "";
  var speed = "";
  var address = "";


  Future<void> updatePosition() async {
    Position pos = await _determinePosition();
    List pm = await placemarkFromCoordinates(pos.latitude, pos.longitude);

    setState(() {
      latitude = pos.latitude;
      longtitude = pos.longitude;
      altitude = pos.altitude.toString();
      speed = pos.speed.toString();

      address = pm[0].toString();
    });
  }


  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  final pi = 22 / 7;
  List<Positioned> markersLoop() {
    List<Positioned> markers = [];
    updatePosition();

    //store user informations in an array or any loopable type
    //store current phone user informations to use in radius range function
//     // Perform the query to retrieve the user documents within the search range
//     QuerySnapshot querySnapshot = await FirebaseFirestore.instance
//         .collection('users')
//         .where('latitude', isGreaterThan: latitude-0.00018)
//         .where('latitude', isLessThan: latitude+0.00018)
//         .where('longitude', isGreaterThan: longtitude-0.00018)
//         .where('longitude', isLessThan: longtitude+0.00018)
//         .get();
// //
// // // Loop over the retrieved documents and add to the markers array by calling markers.add(radiusRange like below
//     querySnapshot.docs.forEach((doc) {
//       // Access the data for each user
//       String name = doc.data()['username'];
//       String email = doc.data()['email'];
//       double olatitude = doc.data()['latitude'];
//       double olongitude = doc.data()['longitude'];
//        String profilePageUrl = doc.data()['dpURL'];
//       String profilePictureUrl = doc.data()['profile_picture_url'];
//       markers.add(radiusRange(latitude, longtitude,
//         olatitude,
//         olongitude,profilePageUrl,profile_picture_url));
//       // ...
//     });

    if(latitude==0.00) {
    }
    else{
      for (int i = 0; i < 5; i++) {
        //loop through array of user information
        //check every user's location details
        //if he/she is range call radius range with that user's location details as parameter
        markers.add(radiusRange(latitude, longtitude,
            latitude + i / 100000 + 0.000005,
            longtitude + i / 100000 + 0.000005));
      }
    }
    return markers;
  }

  Positioned radiusRange(
      double userLati, double userLongi, double lat, double long) {  //Add profile page as a parameter
    double markerPosX = 0;
    double markerPosY = 0;
    //In a for loop , loop over every user in firestore
    double rangeLatiPlus = userLati + 0.00018;
    double rangeLatiMinus = userLati - 0.00018;
    double rangeLongiPlus = userLongi + 0.00018;
    double rangeLongiMinus = userLongi - 0.00018;
    int boxX;
    int boxY;

    if ((rangeLatiMinus < lat && lat < rangeLatiPlus) &&
        (long > rangeLongiMinus && long < rangeLongiPlus)) {
      //Access User's datas
      //Get the user's phone display details
      ui.Size screenSize = MediaQuery.of(context).size;
      double screenWidthPx = screenSize.width;
      double screenHeightPx = screenSize.height;
      double screenDensity = MediaQuery.of(context).devicePixelRatio;
      double screenWidthCm = screenWidthPx / (screenDensity * 2.54);
      double screenHeightCm = screenHeightPx / (screenDensity * 2.54);
      double centerX = screenWidthPx / 2;
      double centerY = screenHeightPx / 2;
      double oneBoxLenght = screenWidthCm / 40;
      //Check the user's distance from the center
      //Check how boxes need to move
      //Calculate 1 box lenght by phone lenght
      //display he marker according to chatGPT
      //attach the user profie link to the marker

      boxX = ((lat - userLati) / 0.000009).round();
      boxY = ((long - userLongi) / 0.000009).round();
      double markerDistanceX =
          boxX * oneBoxLenght; //distance in cm from center in x axis
      double markerDistanceY =
          boxY * oneBoxLenght; //distance in cm from center in y axis

      markerPosX = centerX + markerDistanceX * 6;
      markerPosY = centerY + markerDistanceY * 6;
    }
    return Positioned(
      left: markerPosX,
      top: markerPosY,
      child: InkWell(
        onDoubleTap: () {
          // Add your navigation code here
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const home_page()),  //add profile page,profile picture from parameter here So can navigate to that Profile
          );
        },
        child: const Icon(        //with image.network object we are displaying profile picture instead of just a marker
          Icons.circle,
          color: Colors.green,
          size: 30,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Positioned> markers = markersLoop();
    return Scaffold(
      backgroundColor: const ui.Color.fromARGB(255, 54, 33, 64),
      body: Stack(
        children: [
          ...markers,
          // radiusRange(6.86235, 79.877302, 6.86245, 79.877402),
          // radiusRange(6.86235, 79.877302, 6.86250, 79.877132),
          // radiusRange(6.86235, 79.877302, 6.86220, 79.877202)

          // Container(
          //     decoration: const BoxDecoration(
          //         image: DecorationImage(
          //             image: AssetImage('assets/background.jpg'),
          //             fit: BoxFit.cover))),
          // const Positioned.fill(
          //     child: Center(
          //   child: Text(''),
          // ))
        ],
      ),
    );
  }
}

//This is the Most Important Page , have to design a UI a bit better though
/////////////////////////////////////////////////////////////
