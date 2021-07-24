import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomRatingBar extends StatelessWidget {
  const CustomRatingBar({
    required this.rate,
  });

  final double rate;

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      initialRating: rate,
      ignoreGestures: true,
      itemSize: 25,
      allowHalfRating: true,
      onRatingUpdate: (ratingValue) {},
      ratingWidget: RatingWidget(
        full: Icon(
          Icons.star,
          color: Colors.deepOrange,
        ),
        half: Icon(
          Icons.star_half_outlined,
          color: Colors.deepOrange,
        ),
        empty: Icon(
          Icons.star,
          color: Colors.grey[300],
        ),
      ),
    );
  }
}
