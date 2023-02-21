import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kcroz/src/repository/authentication_repository/authentication_repository.dart';

class SignUpController extends GetxController{
  // to make SignUpController callable
  static SignUpController get instance => Get.find();

  // TextField Controllers to get data  from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  // Call this function from Design : This will do the registrationPart
  void registerUser(String email, String password){
    AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
  }
}