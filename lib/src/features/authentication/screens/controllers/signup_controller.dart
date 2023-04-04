import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{
  // to make SignUpController callable
  static SignUpController get instance => Get.find();

  // TextField Controllers to get data  from TextFields
  final phoneNo = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final religion = TextEditingController();
  final interests = TextEditingController();
  final occupation = TextEditingController();
  final university = TextEditingController();
  final college = TextEditingController();
}