import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomRatingBar extends StatelessWidget {
  const CustomRatingBar({
    required this.rate,
  });

  final double rate;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: 3,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.deepOrange,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
    // return RatingBar(
    //   initialRating: rate,
    //   ignoreGestures: true,
    //   itemSize: 25,
    //   allowHalfRating: true,
    //   onRatingUpdate: (ratingValue) {},
    //   ratingWidget: RatingWidget(
    //     full: Icon(
    //       Icons.star,
    //       color: Colors.deepOrange,
    //     ),
    //     half: Icon(
    //       Icons.star_half_outlined,
    //       color: Colors.deepOrange,
    //     ),
    //     empty: Icon(
    //       Icons.star,
    //       color: Colors.grey[300],
    //     ),
    //   ),
    // );
  }
}
