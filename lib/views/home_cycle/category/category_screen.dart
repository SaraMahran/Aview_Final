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
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/filter_icon.png', width: 25),
          ),
        ],
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
              final categoryProvider =
                  Provider.of<CategoryProvider>(context, listen: false);
              return CategoryItem(
                onTap: () {
                  categoryProvider
                      .setPlaceName(categoryScreenList[index].title);
                  categoryProvider.setPlaceImg(categoryScreenList[index].img);
                  categoryProvider.setPlaceRate(categoryScreenList[index].rate);
                  categoryProvider.setPlaceOptionList(
                      categoryScreenList[index].optionsTitleList);
                  Navigator.pushNamed(context, CategoryDetailsScreenRoute);
                },
                img: categoryScreenList[index].img,
                title:  categoryScreenList[index].title,
                desc: categoryScreenList[index].desc,
                rate: categoryScreenList[index].rate,
                optionListWidget: SizedBox(
                  height: 40,
                  child: ListView.builder(
                    itemCount:
                        categoryScreenList[index].optionsTitleList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, idx) {
                      return Row(
                        children: [
                          Icon(Icons.check, color: Colors.deepOrange, size: 30),
                          Text(
                            categoryScreenList[index].optionsTitleList[idx],
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class CategoryProvider extends ChangeNotifier {
  late double _rate;
  late List<String> _options;
  late String _name;
  late String _img;

  String get getPlaceName => _name;

  String get getPlaceImg => _img;

  double get getPlaceRate => _rate;

  List<String> get getPlaceOptionList => _options;

  void setPlaceName(String name) {
    this._name = name;
    notifyListeners();
  }

  void setPlaceImg(String img) {
    this._img = img;
    notifyListeners();
  }

  void setPlaceRate(double rate) {
    this._rate = rate;
    notifyListeners();
  }

  void setPlaceOptionList(List<String> options) {
    this._options = options;
    notifyListeners();
  }
}
