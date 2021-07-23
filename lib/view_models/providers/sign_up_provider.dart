import 'package:aview2/models/user_info_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aview2/models/user_info_model.dart';

class SignUpProvider extends ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('UserInfo');

  Future<void> addUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String image,
  }) {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'firstName': firstName,
          'latName': lastName,
          'email': email,
          'password': password,
          'image': image,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
