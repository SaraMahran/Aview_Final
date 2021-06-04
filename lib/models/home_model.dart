import 'package:flutter/material.dart';

class HomeModel {
  final String title;
  final String imagePath;

  HomeModel(this.title, this.imagePath);
}

List<HomeModel> homeModelList = [
  HomeModel('Cafés', 'assets/images/coffee_photo.png'),
  HomeModel('Restaurants', 'assets/images/Resturant_2.png'),
  HomeModel('Gyms', 'assets/images/dumbbell.png'),
  HomeModel('Art Galleries', 'assets/images/painting.png'),
  HomeModel('Cultural Centers', 'assets/images/people.png'),
  HomeModel('Cinemas', 'assets/images/Cinemas.png'),
  HomeModel('Theatres', 'assets/images/masks.png'),
  HomeModel('Co-working Spaces', 'assets/images/workplace.png'),
  HomeModel('Museums', 'assets/images/museum.png'),
  HomeModel('Games', 'assets/images/video-game.png'),
  HomeModel('Parks', 'assets/images/park-1.png'),
  HomeModel('Dancing Centers', 'assets/images/dancing.png'),
  HomeModel('Concerts', 'assets/images/concert.png'),
  HomeModel('Night Life', 'assets/images/night-life.png'),
];
