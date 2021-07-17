class ReviewModel {
  var noOfLikes;
  var reviewerID;
  var reviewID;
  var date;

  ReviewModel({
    required this.noOfLikes,
    required this.reviewerID,
    required this.date,
    required this.reviewID,
  });

  factory ReviewModel.fromJsom(Map<String, dynamic> data) {
    return ReviewModel(
      noOfLikes: data['noOfLikes'],
      reviewerID: data['reviewerID'],
      date: data['date'],
      reviewID: data['reviewID'],
    );
  }
}
