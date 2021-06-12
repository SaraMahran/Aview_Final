import 'package:aview2/components/custom_rating_bar.dart';
import 'package:aview2/helper/helper_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'category_screen.dart';

class CategoryDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeText = Theme.of(context).textTheme;
    final categoryProvider =
        Provider.of<CategoryProvider>(context, listen: false);
    final responsive = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shadowColor: Colors.transparent,
        title: Text(categoryProvider.getPlaceName),
      ),
      body: ListView(
        children: [
          Image.asset(categoryProvider.getPlaceImg, height: 150),
          Center(child: CustomRatingBar(rate: categoryProvider.getPlaceRate)),
          Center(
            child: SizedBox(
              height: 50,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categoryProvider.getPlaceOptionList.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Icon(Icons.check, color: Colors.orange, size: 30),
                      Text(
                        categoryProvider.getPlaceOptionList[index],
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Divider(thickness: 8, color: Colors.deepOrange),
          Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.center,
            children: [
              CustomContainerCategoryDetails(
                img: 'assets/images/facebook_logo.png',
                title: 'Add Review',
              ),
              CustomContainerCategoryDetails(
                img: 'assets/images/facebook_logo.png',
                title: 'Add Photo',
              ),
              CustomContainerCategoryDetails(
                img: 'assets/images/facebook_logo.png',
                title: 'Add List',
              ),
              CustomContainerCategoryDetails(
                img: 'assets/images/facebook_logo.png',
                title: 'Share',
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Text('Reviews', style: themeText.headline1),
          ),
          SizedBox(
            height: responsive.height * .22,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 8,
              itemBuilder: (context, index) {
                return ReviewsOfPlaceItem(
                  reviewerName: 'Malak $index',
                  img: categoryProvider.getPlaceImg,
                  reviewDescription: 'best chicken Sandwich in the world',
                  reviewDate: '5/3/2021',
                  rate: 2.5,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ReviewsOfPlaceItem extends StatelessWidget {
  late String img;

  late String reviewerName;
  late String reviewDate;
  late double rate;
  late String reviewDescription;

  ReviewsOfPlaceItem({
    required this.img,
    required this.reviewerName,
    required this.reviewDate,
    required this.rate,
    required this.reviewDescription,
  });

  @override
  Widget build(BuildContext context) {
    final themeText = Theme.of(context).textTheme;
    final responsive = MediaQuery.of(context).size;
    return Container(
      width: responsive.width * .5,
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.asset(
                    img,
                    width: 60,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(reviewerName, style: themeText.headline3),
                  Text(reviewDate, style: themeText.headline3),
                  CustomRatingBar(rate: rate),
                ],
              ),
            ],
          ),
          SizedBox(height: 8),
          Container(
              decoration: kCustomContainerDecoration,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(reviewDescription),
              ))
        ],
      ),
    );
  }
}

class CustomContainerCategoryDetails extends StatelessWidget {
  late String img;
  late String title;

  CustomContainerCategoryDetails({
    required this.img,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final themeText = Theme.of(context).textTheme;
    final responsive = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(4),
      width: responsive.width * .45,
      decoration: kCustomContainerDecoration,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(img),
            Text(title, style: themeText.headline3),
          ],
        ),
      ),
    );
  }
}
