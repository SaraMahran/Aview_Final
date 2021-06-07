class UserInfo {
  late String email;
  late String firstName;
  late String lastName;
  late String userName;
  late String profilePhoto;
  UserInfo.fromJson(Map<String, dynamic> data) {
    email = data['email'] ?? 'email';
    firstName = data['firstName'] ?? 'firstName';
    lastName = data['lastName'] ?? 'lastName';
    userName = data['userName'] ?? 'userName';
    profilePhoto = data['[profilePhoto'] ?? 'profilePhoto';
  }
}
