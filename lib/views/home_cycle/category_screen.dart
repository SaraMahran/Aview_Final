import 'package:aview2/components/items/category_item.dart';
import 'package:aview2/components/widgets/buttons/custom_rounded_border_button.dart';
import 'package:aview2/models/category_model.dart';
import 'package:aview2/utils/routing_constants.dart';
import 'package:aview2/view_models/providers/home_provider.dart';
import 'package:flutter/material.dart';
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
              CustomRoundedBorderButton(
                  onTap: () =>
                      Navigator.pushNamed(context, NewPlacesScreenRoute),
                  titleBtn: 'New Places'),
              CustomRoundedBorderButton(
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
              return CategoryItem(
                img: categoryScreenList[index].img,
                title: categoryScreenList[index].title,
                desc: categoryScreenList[index].desc,
                rate: categoryScreenList[index].rate,
                optionListWidget:           SizedBox(
                  height: 70,
                  child: ListView.builder(
                    itemCount: categoryScreenList[index].optionsTitleList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, idx) {
                      return Row(
                        children: [
                          Icon(Icons.check, color: Colors.orange, size: 30),
                          Text(categoryScreenList[index].optionsTitleList[idx],
                              style: Theme.of(context).textTheme.headline2),
                        ],
                      );
                    },
                  ),
                )
                ,
              );
            },
          )
        ],
      ),
    );
  }
}