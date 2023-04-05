import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kcroz/src/features/core/screens/map/check_n_scan.dart';

// ignore: camel_case_types
class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page>{
  late Position _currentPosition;
  final Geolocator _geolocator = Geolocator();

    @override
    void initState() {
      super.initState();
      _getCurrentLocation();
      // Update the user's location every minute
      Timer.periodic(Duration(minutes: 1), (Timer t) => _updateUserLocation());
    }

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

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
            width: 400,
            height: 400,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(400.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                          return const check_n_scan();
                        }));
                  },
                  child: const Text(
                    "Display Map",
                    style: TextStyle(fontSize: 18),
                  )),
            )));
  }

}




