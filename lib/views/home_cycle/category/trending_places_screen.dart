import 'package:aview2/helper/helper_style.dart';
import 'package:aview2/view_models/providers/place_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TrendingPlacesScreen extends StatefulWidget {
  @override
  _TrendingPlacesScreenState createState() => _TrendingPlacesScreenState();
}

class _TrendingPlacesScreenState extends State<TrendingPlacesScreen> {
  @override
  void initState() {
    Provider.of<PlaceProvider>(context, listen: false).retrievePlaces();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final placesProvider = Provider.of<PlaceProvider>(context, listen: false);
    final textStyle =
        Theme.of(context).textTheme.headline3!.copyWith(fontSize: 12);
    return Scaffold(
      appBar: AppBar(shadowColor: Colors.transparent),
      body: Container(
        child: FutureBuilder(
          future: placesProvider.retrievePlaces(),
          builder: (context, snapshot) {
            if (placesProvider.getPlaceList.isNotEmpty) {
              return ListView.builder(
                itemCount: placesProvider.getPlaceList.length,
                itemBuilder: (context, index) {
                  final data = placesProvider.getPlaceList.elementAt(index);
                  return Container(
                    decoration: kCustomContainerDecoration,
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              data.placeName,
                              style: textStyle,
                            ),
                            Text(
                              data.location.toString(),
                              style: textStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(data.category, style: textStyle),
                            Text(data.placeID, style: textStyle),
                            Text(data.noOfReviewers.toString(),
                                style: textStyle),
                          ],
                        ),
                        Image.network(
                          data.image ??
                              'https://i.postimg.cc/sg1pfwDD/chicken-fila.jpg',
                          width: 20,
                          height: 20,
                        )
                      ],
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(color: Colors.orange),
              );
            }
          },
        ),
      ),
    );
  }
}
