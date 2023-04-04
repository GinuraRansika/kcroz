import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String username;
  final String email;
  final String phoneNumber;
  final String dpURL;
  final String religion;
  final String gender;
  final String drink;
  final String smoke;
  final String vegan;
  final String sexualOrientation;
  final String birthday;
  final String interests;
  final String occupation;
  final String university;
  final String college;
  final String feedImage01URL;
  final String feedImage02URL;
  final String feedImage03URL;
  final String feedImage04URL;
  final List followers;

  const UserModel({
    required this.uid,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.dpURL,
    required this.religion,
    required this.gender,
    required this.drink,
    required this.smoke,
    required this.vegan,
    required this.sexualOrientation,
    required this.birthday,
    required this.occupation,
    required this.university,
    required this.college,
    required this.interests,
    required this.feedImage01URL,
    required this.feedImage02URL,
    required this.feedImage03URL,
    required this.feedImage04URL,
    required this.followers,
  });

  Map<String, dynamic> toJson() => {
    "username" : username,
    "dpURL" : dpURL,
    "uid" : uid,
    "email" : email,
    "phoneNumber" : phoneNumber,
    "birthday" : birthday,
    "religion" : religion,
    "gender" : gender,
    "sexualOrientation" : sexualOrientation,
    "occupation" : occupation,
    "university" : university,
    "college" : college,
    "drink" : drink,
    "smoke" : smoke,
    "vegan" : vegan,
    "interests" : interests,
    "feedImage01URL": feedImage01URL,
    "feedImage02URL": feedImage02URL,
    "feedImage03URL": feedImage03URL,
    "feedImage04URL": feedImage04URL,
    "followers" : followers,
  };

  static UserModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
      username: snapshot["username"],
      dpURL: snapshot["dpURL"],
      uid: snapshot["uid"],
      email: snapshot["email"],
      phoneNumber: snapshot["phoneNumber"],
      religion: snapshot["religion"],
      gender: snapshot["gender"],
      drink: snapshot["drink"],
      smoke: snapshot["smoke"],
      vegan: snapshot["vegan"],
      sexualOrientation: snapshot["sexualOrientation"],
      birthday: snapshot["birthday"],
      interests: snapshot["interests"],
      occupation: snapshot["occupation"],
      university: snapshot["university"],
      college: snapshot["college"],
      feedImage01URL: snapshot["feedImage01URL"],
      feedImage02URL: snapshot["feedImage02URL"],
      feedImage03URL: snapshot["feedImage03URL"],
      feedImage04URL: snapshot["feedImage04URL"],
      followers: snapshot["followers"],
    );
  }


}