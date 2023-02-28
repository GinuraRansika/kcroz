import 'dart:typed_data';

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
}