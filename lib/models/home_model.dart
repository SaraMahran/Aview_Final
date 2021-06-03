import 'package:flutter/material.dart';

class HomeModel {
  final String title;
  final String imagePath;

  HomeModel(this.title, this.imagePath);
}

List<HomeModel> homeModelList = [
  HomeModel('Cafés', 'assets/images/coffee-cup.png'),
  HomeModel('Restaurants', 'assets/images/Resturant_2.png'),
  // HomeModel('hello suzan', 'assets/lottie/35115-women-arms-workout.json'),
  // HomeModel('hello ahmed', 'assets/lottie/35115-women-arms-workout.json'),
  // HomeModel('hello eslam', 'assets/lottie/35115-women-arms-workout.json'),
];
