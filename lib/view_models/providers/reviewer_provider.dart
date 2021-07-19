import 'package:aview2/models/reviewer_model.dart';
import 'package:aview2/utils/routing_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:aview2/models/user_info_model.dart';

class ReviewerProvider with ChangeNotifier {
  late ReviewerModel reviewer;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  late String firstName;
  late String lastName;
  late String email;
  late String password;
  late String image;

  Future<void> retrieveUserData(String userID) async {
    print('userID = $userID');
    final userInfoSnapShot = await FirebaseFirestore.instance
        .collection('UserInfo')
        .doc(userID)
        .get();
    print('ReviewData = ${userInfoSnapShot.data()}');
    print('image = ${userInfoSnapShot['list']['image']}');
    print('listData = ${userInfoSnapShot['list']['title']}');
    // print(
    //     'imageList = ${userInfoSnapShot['list']['image']},titleList = ${userInfoSnapShot['list']['title']}');

    // reviewer = ReviewerModel.fromJson(
    //   snapShot.data()!,
    //   userInfoSnapShot.data()!,
    // );
    // reviewer.reviewerID = snapShot.id;
    // print('noOFReviews = ${reviewer.noOFReviews}');
    // print('places = ${reviewer.places}');
    // print('reviewerID = ${reviewer.reviewerID}');
  }
// Future<List<UserInfoModel>> getUserData() async {
//   final snapShot = await firestore.collection('Users').get();
//   List<UserInfoModel> users = [];
//   for (var doc in snapShot.docs) {
//     var data = doc.data();
//     users.add()
//   }

// snapShot
//return users;
}
