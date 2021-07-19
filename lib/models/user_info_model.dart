class UserInfoModel {
  late String email;
  late String firstName;
  late String lastName;
  late String profilePhoto;
  UserInfoModel.fromJson(Map<String, dynamic> data) {
    email = data['email'] ?? 'email';
    firstName = data['2.03'
            'firstName'] ??
        'firstName';
    lastName = data['lastName'] ?? 'lastName';
    profilePhoto = data['[profilePhoto'] ?? 'profilePhoto';
  }
}
