import 'package:aview2/models/review_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ReviewProvider with ChangeNotifier {
  final List<ReviewModel> _list = [];

  List<ReviewModel> get getReviewList => _list;

  Future<void> retrieveReviews() async {
    final result = await FirebaseFirestore.instance.collection('Review').get();
    _list.clear();
    result.docs.forEach((element) {
      final jsonData = element.data();
      final review = ReviewModel.fromJsom(jsonData);
      _list.add(review);
      // print('noOfLikes = ${review.noOfLikes}');
    });
  }
}
