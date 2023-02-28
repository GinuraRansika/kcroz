import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{
  // to make SignUpController callable
  static SignUpController get instance => Get.find();

  // TextField Controllers to get data  from TextFields
  final phoneNo = TextEditingController();
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final fullName = TextEditingController();
  final birthday = TextEditingController();
  final gender = TextEditingController();
  final sexualOrientation = TextEditingController();
  final password = TextEditingController();
  final interests = TextEditingController();
}