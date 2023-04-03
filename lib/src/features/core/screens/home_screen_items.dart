import 'package:flutter/cupertino.dart';
import 'package:kcroz/src/features/core/screens/map/home_page_map.dart';
import 'package:kcroz/src/features/core/screens/map/home_page.dart';
import 'package:kcroz/src/features/core/screens/profile/profile_screen.dart';

List<Widget> homeScreenItems = [
  home_page(),
  Center(child: Text("Game")),
  Center(child: Text("Message")),
  ProfileScreen(),
];