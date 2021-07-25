class PlaceModel {
  var category;
  var location;
  var noOfReviewers;
  var placeID;
  var placeName;
  var image;

  PlaceModel({
    required this.category,
    required this.location,
    required this.noOfReviewers,
    required this.placeID,
    required this.placeName,
    required this.image,
  });

  factory PlaceModel.fromJsom(Map<String, dynamic> data) {
    return PlaceModel(
      category: data['category'],
      location: data['location'],
      noOfReviewers: data['noOfReviewers'],
      placeID: data['placeID'],
      placeName: data['placeName'],
      image: data['image'],
    );
  }

  Map<String, dynamic> toJson() => {
        'category': category,
        'location': location,
        'noOfReviewers': noOfReviewers,
        'placeID': placeID,
        'placeName': placeName,
        'image': image
      };
}
