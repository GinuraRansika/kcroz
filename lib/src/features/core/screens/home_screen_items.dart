import 'package:flutter/cupertino.dart';
import 'package:kcroz/src/features/core/screens/map/home_page_map.dart';
import 'package:kcroz/src/features/core/screens/map/home_page.dart';
import 'package:kcroz/src/features/core/screens/profile/profile_screen.dart';

List<Widget> homeScreenItems = [
  HomePage(),
  HomePageMap(),
  const Center(child: Text("Message")),
  ProfileScreen(),
];