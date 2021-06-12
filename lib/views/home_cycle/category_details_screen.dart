import 'package:aview2/components/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'category_screen.dart';

class CategoryDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoryProvider =
        Provider.of<CategoryProvider>(context, listen: false);
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
              height: 80,
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
        ],
      ),
    );
  }
}
