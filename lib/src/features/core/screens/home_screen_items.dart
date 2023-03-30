import 'package:flutter/cupertino.dart';
import 'package:kcroz/src/features/core/screens/map/home_page_map.dart';
import 'package:kcroz/src/features/core/screens/map/home_page.dart';

List<Widget> homeScreenItems = [
  HomePageMap(),
  HomePageMap(),
  const Center(child: Text("Message")),
  ProfileScreen(),
];