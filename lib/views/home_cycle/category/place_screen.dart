import 'package:aview2/components/custom_rating_bar.dart';
import 'package:aview2/helper/helper_style.dart';
import 'package:aview2/utils/routing_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'category_screen.dart';

class PlaceScreen extends StatefulWidget {
  @override
  _PlaceScreenState createState() => _PlaceScreenState();
}

class _PlaceScreenState extends State<PlaceScreen> {
  String dropdownValue = 'Haram';

  @override
  Widget build(BuildContext context) {
    final themeText = Theme.of(context).textTheme;
    final categoryProvider =
        Provider.of<CategoryProvider>(context, listen: false);
    final responsive = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.deepOrange, //change your color here
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        shadowColor: Colors.transparent,
        title: Text(
          categoryProvider.getPlaceName,
          style: TextStyle(
            color: Colors.deepOrange,
          ),
        ),
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
                      Icon(Icons.check, color: Colors.deepOrange, size: 30),
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
          ListTile(
            leading: Text('Contact', style: themeText.headline1),
            trailing: Text('19019', style: themeText.headline3),
          ),
          ListTile(
            leading: Text('Open', style: themeText.headline1),
            trailing: Text('11:00 AM - 12:00 AM', style: themeText.headline3),
          ),
          ListTile(
            leading: Text('Branches', style: themeText.headline1),
            trailing: Container(
              decoration: kCustomContainerDecoration,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: DropdownButton<String>(
                value: dropdownValue,
                underline: SizedBox(),
                icon: Icon(Icons.keyboard_arrow_down, color: Colors.black),
                iconSize: responsive.width * .08,
                onChanged: (newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: [
                  'Haram',
                  'October',
                  'Faisal',
                  'Shubra',
                  'Nasr City',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: themeText.headline3),
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(thickness: 8, color: Colors.deepOrange),
          SizedBox(
            height: 10,
          ),
          Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.center,
            children: [
              CustomContainerCategoryDetails(
                onTap: () {
                  Navigator.pushNamed(context, TextClassifierModelRoute);
                },
                img: 'assets/images/feedback.png',
                title: 'Add Review',
              ),
              CustomContainerCategoryDetails(
                onTap: () {},
                img: 'assets/images/picture.png',
                title: 'Add Photo',
              ),
              CustomContainerCategoryDetails(
                onTap: () {},
                img: 'assets/images/add-button.png',
                title: 'Add To List',
              ),
              CustomContainerCategoryDetails(
                onTap: () {},
                img: 'assets/images/report.png',
                title: 'Report',
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
                  reviewDescription: 'Best chicken Sandwich in the world.',
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
      width: responsive.width * .55,
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
                  Text(reviewerName, style: themeText.headline2),
                  Text(reviewDate, style: themeText.headline2),
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
              child: Text(
                reviewDescription,
                style: themeText.headline3!.copyWith(
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomContainerCategoryDetails extends StatelessWidget {
  late String img;
  late String title;

  late VoidCallback onTap;

  CustomContainerCategoryDetails(
      {required this.img, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final themeText = Theme.of(context).textTheme;
    final responsive = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(4),
        width: responsive.width * .45,
        height: responsive.height * .07,
        decoration: kCustomContainerDecoration,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                img,
                scale: 7,
              ),
              Text(title, style: themeText.headline3),
            ],
          ),
        ),
      ),
    );
  }
}
