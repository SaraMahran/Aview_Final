import 'package:aview2/models/user_info_model.dart';
import 'package:aview2/view_models/providers/reviewer_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aview2/models/user_info_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpProvider extends ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('UserInfo');

  Future<void> addUser({
    required String firstName,
    required BuildContext context,
    required String lastName,
    required String email,
    required String password,
    required String image,
  }) {
    return users.add({
      'firstName': firstName,
      'latName': lastName,
      'email': email,
      'password': password,
      'image': image,
    }).then((value) async {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('UUID', value.id);
      Provider.of<ReviewerProvider>(context).setUserInfoUuid = value.id;
      Provider.of<ReviewerProvider>(context).retrieveUserData();
      print('UUID = ${Provider.of<ReviewerProvider>(context).getUserInfoUuid}');
      print('firstName = ${Provider.of<ReviewerProvider>(context).firstName}');
      print('UUID prefs = ${prefs.getString('UUID')}');
    }).catchError((error) => print("Failed to add user: $error"));
  }
}
