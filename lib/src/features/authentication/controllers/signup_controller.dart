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

  //Call this Function from Design & it will do the rest
  Future<void> registerUser(String email, String password) async {
    String? error = await AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
    if(error != null) {
      Get.showSnackbar(GetSnackBar(message: error.toString(),));
    }
  }
}