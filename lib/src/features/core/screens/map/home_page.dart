import 'package:flutter/material.dart';
import 'package:kcroz/src/features/core/screens/map/check_n_scan.dart';

// ignore: camel_case_types
class home_page extends StatelessWidget {
  const home_page({super.key});

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
