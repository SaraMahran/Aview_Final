import 'package:flutter/material.dart';
import '../custom_rating_bar.dart';

class CategoryItem extends StatelessWidget {
  late String img;
  late String title;
  late String desc;
  late double rate;
  late Widget optionListWidget;
  late VoidCallback onTap;

  CategoryItem({
    required this.img,
    required this.title,
    required this.desc,
    required this.rate,
    required this.optionListWidget,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.network(
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CustomRatingBar(rate: rate),
                    ),
                    Text(desc),
                  ],
                )
              ],
            ),
            optionListWidget,
            Divider(thickness: 1.5,color: Colors.deepOrange)
          ],
        ),
      ),
    );
  }
}

