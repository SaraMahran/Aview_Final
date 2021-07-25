import 'package:aview2/models/reviewer_model.dart';
import 'package:aview2/utils/routing_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:aview2/models/user_info_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReviewerProvider with ChangeNotifier {
  late ReviewerModel reviewer;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  late String firstName;
  late String lastName;
  late String email;
  late String password;
  late String image;

  late String userInfoUuid;

  String get getUserInfoUuid => userInfoUuid;

  String get getFirstName => firstName;

  String get getLastName => lastName;

  String get getEmail => email;

  String get getPassword => password;

  String get getImage => image;

  set setUserInfoUuid(String userInfoUuid) => this.userInfoUuid = userInfoUuid;

  set setFirstName(String firstName) => this.firstName = firstName;

  set setLastName(String lastName) => this.lastName = lastName;

  set setEmail(String email) => this.email = email;

  set setPassword(String password) => this.password = password;

  set setImage(String image) => this.image = image;

  Future<void> retrieveUserData() async {
    final prefs = await SharedPreferences.getInstance();
    print('UUID prefs = ${prefs.getString('UUID')}');
    final userInfoSnapShot = await FirebaseFirestore.instance
        .collection('UserInfo')
        .doc(prefs.getString('UUID').toString())
        .get();
    firstName = userInfoSnapShot['firstName'];
    lastName = userInfoSnapShot['lastName'];
    email = userInfoSnapShot['email'];
    password = userInfoSnapShot['password'];
    image = userInfoSnapShot['image'];

    // print('ReviewData = ${userInfoSnapShot.data()}');
    // print('image = ${userInfoSnapShot['list']['image']}');
    // print('listData = ${userInfoSnapShot['list']['title']}');
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
