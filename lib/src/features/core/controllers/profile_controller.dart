import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kcroz/src/features/authentication/screens/models/user_model.dart';

import '../../../services/authentication_repository.dart';
import '../../../services/user_repository.dart';

class ProfileController extends GetxController{
  static ProfileController get instance => Get.find();

  final userName = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final religion = TextEditingController();
  final gender = TextEditingController();
  final birthday = TextEditingController();
  final interests = TextEditingController();
  final sexualOrientation = TextEditingController();




  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  getUserData(){
    final email = _authRepo.firebaseUser.value?.email;
    if(email != null){
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar("Error", "Login to continue");
    }
  }

  Future<List<UserModel>> getAllUser() async{
    return await _userRepo.allUser();
  }

  updateUserRecord (UserModel user) async{
    await _userRepo.updateUserRecord(user);
  }
}