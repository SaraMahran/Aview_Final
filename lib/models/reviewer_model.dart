import 'package:flutter/cupertino.dart';
import 'package:aview2/models/user_info_model.dart';

class ReviewerModel {
  late UserInfo info;
  late bool verifiedReviewer;
  late List<dynamic> favoriteReviewers;
  late List<dynamic> places;
  late int noOFReviews;
  late String reviewerID;

  ReviewerModel.fromJson(
      Map<String, dynamic> data, Map<String, dynamic> userData) {
    verifiedReviewer = data['verifiedReviewer'] ?? 'verifiedReviewer';
    favoriteReviewers = data['favoriteReviewers'] ?? ['favoriteReviewers'];
    places = data['places'] ?? [];
    noOFReviews = data['noOfReviewers'] ?? 0;
    info = UserInfo.fromJson(userData);
  }
}
