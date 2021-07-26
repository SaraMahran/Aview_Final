import 'package:aview2/models/place_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class PlaceProvider with ChangeNotifier {
  final List<PlaceModel> _list = [];
  final List<PlaceModel> _listCafe = [];

  List<PlaceModel> get getPlaceList => _list;

  List<PlaceModel> get getCafeList => _list;

  Future<void> retrievePlaces(String type) async {
    final result = await FirebaseFirestore.instance.collection('Place').get();
    _list.clear();
    _listCafe.clear();
    result.docs.forEach((element) {
      final jsonData = element.data();
      final place = PlaceModel.fromJsom(jsonData);
      final category = jsonData['category'];
      if (category == type) {
        _list.add(place);
        print('category = $category');
      }
      // if (category == 'Cafe') {
      //   _listCafe.add(place);
      // }

      // print('placeName = ${place.placeName}');
    });
  }
}
