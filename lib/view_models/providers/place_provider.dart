import 'package:aview2/models/place_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class PlaceProvider with ChangeNotifier {
  final List<PlaceModel> _list = [];

  List<PlaceModel> get getPlaceList => _list;

  Future<void> retrievePlaces() async {
    final result = await FirebaseFirestore.instance.collection('Place').get();
    _list.clear();
    result.docs.forEach((element) {
      final jsonData = element.data();
      final place = PlaceModel.fromJsom(jsonData);
      final category = jsonData['category'];
      if (category == 'Restaurant') {
        _list.add(place);
        print('category = $category');
      }

      // print('placeName = ${place.placeName}');
    });
  }
}
