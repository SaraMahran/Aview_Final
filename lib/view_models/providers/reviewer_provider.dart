import 'package:aview2/models/reviewer_model.dart';
import 'package:aview2/utils/routing_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:aview2/models/user_info_model.dart';

class ReviewerProvider with ChangeNotifier {
  late ReviewerModel reviewer;

  Future<void> retriveUserData(String userID) async {
    print(userID);
    final snapShot = await FirebaseFirestore.instance
        .collection('Reviewer')
        .doc(userID)
        .get();
    print(snapShot.data());
    final userInfoSnapShot = await FirebaseFirestore.instance
        .collection('UserInfo')
        .doc(userID)
        .get();
    reviewer =
        ReviewerModel.fromJson(snapShot.data()!, userInfoSnapShot.data()!);
    reviewer.reviewerID = snapShot.id;
    print('noOFReviews = ${reviewer.noOFReviews}');
    print('places = ${reviewer.places}');
    print('reviewerID = ${reviewer.reviewerID}');
  }
}
