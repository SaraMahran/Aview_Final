class PlaceModel {
  var category;
  var location;
  var noOfReviewers;
  var placeID;
  var placeName;

  PlaceModel({
    required this.category,
    required this.location,
    required this.noOfReviewers,
    required this.placeID,
    required this.placeName,
  });

  factory PlaceModel.fromJsom(Map<String, dynamic> data) {
    return PlaceModel(
      category: data['category'],
      location: data['location'],
      noOfReviewers: data['noOfReviewers'],
      placeID: data['placeID'],
      placeName: data['placeName'],
    );
  }

  Map<String, dynamic> toJson() => {
        'category': category,
        'location': location,
        'noOfReviewers': noOfReviewers,
        'placeID': placeID,
        'placeName': placeName
      };
}
