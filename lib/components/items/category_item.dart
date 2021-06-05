// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CategoryItem extends StatelessWidget {
  late String img;
  late String title;
  late String desc;
  late double rate;
  late Widget optionListWidget;
  CategoryItem({
    required this.img,
    required this.title,
    required this.desc,
    required this.rate,
    required this.optionListWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                img,
                width: 150,
                height: 100,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headline1,
                  ),
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
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Text(desc),
                ],
              )
            ],
          ),
          optionListWidget,
        ],
      ),
    );
  }
}
