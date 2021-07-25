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
    final textStyle = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.deepOrange),
        shadowColor: Colors.transparent,
        title: Text('Trending places',style: TextStyle(color: Colors.deepOrange),),
        centerTitle: true,
      ),
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
                    margin: EdgeInsets.all(12),
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            data.image ??
                                'https://i.postimg.cc/sg1pfwDD/chicken-fila.jpg',
                            width: 80,
                            height: 80,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  data.placeName,
                                  style: textStyle.headline1!
                                      .copyWith(fontSize: 18),
                                ),
                                SizedBox(width: 20),
                                Text(
                                  data.location.toString(),
                                  style: textStyle.headline2!
                                      .copyWith(fontSize: 12),
                                ),
                              ],
                            ),
                            Text(data.category,
                                style: textStyle.headline3!
                                    .copyWith(fontSize: 12)),
                            Text('Reviews No.${data.placeID}',
                                style: textStyle.headline3!
                                    .copyWith(fontSize: 14)),
                          ],
                        ),
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
