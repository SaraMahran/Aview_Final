import 'package:aview2/utils/routing_constants.dart';
import 'package:aview2/view_models/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shadowColor: Colors.transparent,
        actions: [],
        title: Text(
          Provider.of<HomeProvider>(context, listen: false).getTitle,
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRoundedButton(
                  onTap: () =>
                      Navigator.pushNamed(context, NewPlacesScreenRoute),
                  titleBtn: 'New Places'),
              CustomRoundedButton(
                  onTap: () =>
                      Navigator.pushNamed(context, TrendingPlacesScreenRoute),
                  titleBtn: 'Trending Places'),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: categoryScreenList.length,
            physics: ScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          categoryScreenList[index].img,
                          width: 150,
                          height: 100,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              categoryScreenList[index].title,
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            RatingBar(
                              initialRating: categoryScreenList[index].rate,
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
                            Text(categoryScreenList[index].desc),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        itemCount:
                            categoryScreenList[index].optionsTitleList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, idx) {
                          return Row(
                            children: [
                              Icon(Icons.check, color: Colors.orange, size: 30),
                              Text(
                                  categoryScreenList[index]
                                      .optionsTitleList[idx],
                                  style: Theme.of(context).textTheme.headline2),
                            ],
                          );
                        },
                      ),
                    )
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomRoundedButton extends StatelessWidget {
  late String titleBtn;
  late VoidCallback onTap;

  CustomRoundedButton({required this.onTap, required this.titleBtn});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.orange, width: 2),
      ),
      onPressed: onTap,
      child: Text(
        titleBtn,
        style: Theme.of(context).textTheme.headline1,
      ),
      color: Colors.orange[100],
    );
  }
}

class CategoryModel {
  String img;
  String title;
  String desc;
  List<String> optionsTitleList;
  double rate;

  CategoryModel(
      {required this.title,
      required this.desc,
      required this.img,
      required this.optionsTitleList,
      required this.rate});
}

List<CategoryModel> categoryScreenList = [
  CategoryModel(
      title: 'Chicken Fila',
      desc: 'Chicken Burger, Fast Food',
      img: 'assets/images/test/chicken_fila_logo.jpeg',
      optionsTitleList: ['delivery', 'indoor'],
      rate: 2),
  CategoryModel(
      title: 'KFC',
      desc: 'Chicken Broast',
      img: 'assets/images/test/kfc_logo.png',
      optionsTitleList: ['delivery', 'Take Out', 'indoor', 'Out door'],
      rate: 4),
  CategoryModel(
      title: 'Chicken Fila',
      desc: 'Chicken Burger, Fast Food',
      img: 'assets/images/test/chicken_fila_logo.jpeg',
      optionsTitleList: ['delivery', 'indoor'],
      rate: 2.5),
  CategoryModel(
      title: 'KFC',
      desc: 'Chicken Broast',
      img: 'assets/images/test/kfc_logo.png',
      optionsTitleList: ['delivery', 'Take Out', 'indoor', 'Out door'],
      rate: 4.5),
];
