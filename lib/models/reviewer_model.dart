import 'package:flutter/cupertino.dart';
import 'package:aview2/models/user_info_model.dart';

class ReviewerModel {
  late UserInfoModel userInfo;
  late bool verifiedReviewer;
  late List<dynamic> favoriteReviewers;
  late List<dynamic> places;
  late int noOFReviews;
  late String reviewerID;

  ReviewerModel.fromJson(
    Map<String, dynamic> data,
    Map<String, dynamic> userData,
  ) {
    verifiedReviewer = data['verifiedReviewer'];
    favoriteReviewers = data['favoriteReviewers'];
    places = data['places'];
    noOFReviews = data['noOfReviewers'];
    userInfo = UserInfoModel.fromJson(userData);
  }
}
