
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kcroz/src/features/authentication/screens/models/user_model.dart';

class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();

  final _database = FirebaseFirestore.instance;

  createUser(UserModel user) async {
    await _database.collection("Users").add(user.toJson())
        .whenComplete(
          () => Get.snackbar("Success", "Your Account has been created.",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green),
    )
        .catchError((error, stackTrace) {
          Get.snackbar("Error", "Something went Wrong. Try again",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.redAccent.withOpacity(0.1),
              colorText: Colors.red);
          print(error.toString());

    });
  }

  Future<UserModel> getUserDetails(String email) async{
    final snapshot = await _database.collection("user").where("email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnap(e)).single;
    return userData;
  }

  Future<List<UserModel>> allUser() async{
    final snapshot = await _database.collection("user").get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnap(e)).toList();
    return userData;
  }


}