import 'package:aview2/helper/helper_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewsItem extends StatelessWidget {
  final String reviewDescription;
  final String reviewPlace;
  final double rate;

  const ReviewsItem({
    required this.reviewDescription,
    required this.reviewPlace,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    var responsive = MediaQuery.of(context).size;

    return Container(
      width: responsive.width * .75,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 6, vertical: 10),
      decoration: kCustomContainerDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(reviewPlace, style: Theme.of(context).textTheme.headline1),
              RatingBar(
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
              ),
            ],
          ),
          Text(reviewDescription)
        ],
      ),
    );
  }
}
