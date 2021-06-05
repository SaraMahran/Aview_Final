import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ReviewProvider with ChangeNotifier {
  Future RetriveReviews() async {
    final result = await FirebaseFirestore.instance.collection('Review').get();
    result.docs.forEach((element) {
      final jsonData = element.data();
      final review = ReviewModel.fromJsom(jsonData);


      print('noOfLikes = ${review.noOfLikes} reviewerID = ${review
          .reviewerID} date = ${review.date} reviewID = ${review.reviewID}');
    });
  }
}

class ReviewModel {
  var noOfLikes;
  var reviewerID;
  var reviewID;
  var date;

  ReviewModel({
    required this.noOfLikes,
    required this.reviewerID,
    required this.date,
    required this.reviewID,
  });

  factory ReviewModel.fromJsom(Map<String, dynamic> data) {
    return ReviewModel(
      noOfLikes: data['noOfLikes'],
      reviewerID: data['reviewerID'],
      date: data['date'],
      reviewID: data['reviewID'],
    );
  }
}
