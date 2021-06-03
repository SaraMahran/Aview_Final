import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ReviewProvider with ChangeNotifier {
  Future RetriveReviews() async {
    final result = await FirebaseFirestore.instance.collection('Review').get();
    result.docs.forEach((element) {
      print(element.data());
    });
  }
}
