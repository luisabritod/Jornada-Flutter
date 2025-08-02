class Usuario {
  final String id;
  final String name;
  final String email;
  final String? profilePictureUrl;

  Usuario({
    required this.id,
    required this.name,
    required this.email,
    this.profilePictureUrl,
  });
}
