import 'dart:ffi';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:kcroz/src/features/core/screens/map/home_page_map.dart';
import 'package:kcroz/src/features/core/screens/map/home_page.dart';

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

  final pi = 22 / 7;
  List<Positioned> markersLoop() {
    List<Positioned> markers = [];
    //store user informations in an array or any loopable type
    //store current phone user informations to use in radius range function
    for (int i = 0; i < 5; i++) {
      //loop through array of user information
      //check every user's location details
      //if he/she is range call radius range with that user's location details as parameter
      markers.add(radiusRange(6.86235, 79.877302,
          6.86245 + i / 100000 + 0.000005, 79.877402 + i / 100000 + 0.000005));
    }
    return markers;
  }

  Positioned radiusRange(
      double userLati, double userLongi, double lat, double long) {
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
                builder: (BuildContext context) => const home_page()),
          );
        },
        child: const Icon(
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
