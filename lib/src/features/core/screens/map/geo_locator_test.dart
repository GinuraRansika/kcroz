import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class geo_locator_test extends StatefulWidget {
  const geo_locator_test({super.key});

  @override
  State<geo_locator_test> createState() => _geo_locator_testState();
}

// ignore:  camel_case_types
class _geo_locator_testState extends State<geo_locator_test> {
  var latitude = "";
  var longtitude = "";
  var altitude = "";
  var speed = "";
  var address = "";

  Future<void> updatePosition() async {
    Position pos = await _determinePosition();
    List pm = await placemarkFromCoordinates(pos.latitude, pos.longitude);

    setState(() {
      latitude = pos.latitude.toString();
      longtitude = pos.longitude.toString();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Geo Location Tracking")),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text("You Last Known Location is :"),
          Text(
            "Latitude$latitude",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Text(
            "Longtitude$longtitude",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Text(
            "Altitude$altitude",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Text(
            "Speed$speed",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const Text("Address :"),
          Text(address)
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          updatePosition();
        },
        tooltip: 'Get Gps Position',
        child: const Icon(Icons.change_circle_outlined),
      ),
    );
  }
}
