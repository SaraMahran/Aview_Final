import 'package:aview2/helper/helper_style.dart';
import 'package:aview2/view_models/providers/place_provider.dart';
import 'package:aview2/view_models/providers/review_provider.dart';
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
    Provider.of<ReviewProvider>(context, listen: false).retrieveReviews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final placesProvider = Provider.of<PlaceProvider>(context, listen: false);
    final reviewProvider = Provider.of<ReviewProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(shadowColor: Colors.transparent),
      body: Container(
        child: FutureBuilder(
          // future: placesProvider.retrievePlaces(),
          future: reviewProvider.retrieveReviews(),
          builder: (context, snapshot) {
            // if (placesProvider.getPlaceList.isNotEmpty) {
            if (reviewProvider.getReviewList.isNotEmpty) {
              return ListView.builder(
                // itemCount: placesProvider.getPlaceList.length,
                itemCount: reviewProvider.getReviewList.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: kCustomContainerDecoration,
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        // Text(placesProvider.getPlaceList
                        //     .elementAt(index)
                        //     .placeName),
                        Text(reviewProvider.getReviewList
                            .elementAt(index)
                            .noOfLikes
                            .toString()),
                      ],
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
//        child: FutureBuilder(
//           future: reviewProvider.retrieveReviews(),
//           builder: (context, snapshot) {
//             if (reviewProvider.getReviewList.isNotEmpty) {
//               return ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: reviewProvider.getReviewList.length,
//                 physics: ScrollPhysics(),
//                 itemBuilder: (context, index) {
//                   return Text(reviewProvider.getReviewList
//                       .elementAt(index)
//                       .reviewID
//                       .toString());
//                 },
//               );
//             } else {
//               return Center(
//                 child: CircularProgressIndicator(
//                   color: Colors.red,
//                 ),
//               );
//             }
//           },
//         ),
