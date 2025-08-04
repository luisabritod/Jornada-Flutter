class UserModel {
  final String id;
  final String name;
  final String email;
  final String? profilePictureUrl;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.profilePictureUrl,
  });
}
