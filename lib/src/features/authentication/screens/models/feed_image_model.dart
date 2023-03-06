import 'package:cloud_firestore/cloud_firestore.dart';

class FeedImageModel {
  final String feedImage01URL;
  final String feedImage02URL;
  final String feedImage03URL;
  final String feedImage04URL;


  const FeedImageModel({
    required this.feedImage01URL,
    required this.feedImage02URL,
    required this.feedImage03URL,
    required this.feedImage04URL,
  });

  Map<String, dynamic> toJson() => {
    "feedImage01URL" : feedImage01URL,
    "feedImage02URL" : feedImage02URL,
    "feedImage03URL" : feedImage03URL,
    "feedImage04URL" : feedImage03URL,
  };

  static FeedImageModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return FeedImageModel(
      feedImage01URL: snapshot["feedImage01URL"],
      feedImage02URL: snapshot["feedImage02URL"],
      feedImage03URL: snapshot["feedImage03URL"],
      feedImage04URL: snapshot["feedImage04URL"],
    );
  }


}