import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String? uid;
  final String username;
  final String email;
  final String phoneNumber;
  final String password;
  final String dpURL;
  final String religion;
  final String gender;
  final String sexualOrientation;
  final String birthday;
  final String interests;
  final List followers;

  const UserModel({
    required this.uid,
    required this.username,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.dpURL,
    required this.religion,
    required this.gender,
    required this.sexualOrientation,
    required this.birthday,
    required this.interests,
    required this.followers,
  });

  Map<String, dynamic> toJson() => {
    "username" : username,
    "dpURL" : dpURL,
    "uid" : uid,
    "email" : email,
    "phoneNumber" : phoneNumber,
    "religion" : religion,
    "gender" : gender,
    "sexualOrientation" : sexualOrientation,
    "birthday" : birthday,
    "interests" : interests,
    "followers" : [],
  };

  static UserModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
      username: snapshot["username"],
      dpURL: snapshot["dpURL"],
      uid: snapshot["uid"],
      email: snapshot["email"],
      password: snapshot["password"],
      phoneNumber: snapshot["phoneNumber"],
      religion: snapshot["religion"],
      gender: snapshot["gender"],
      sexualOrientation: snapshot["sexualOrientation"],
      birthday: snapshot["birthday"],
      interests: snapshot["interests"],
      followers: snapshot["followers"],
    );
  }
}