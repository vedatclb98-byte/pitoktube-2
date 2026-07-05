class UserModel {
  final String id;
  final String username;
  final String displayName;
  final String avatarUrl;
  final bool verified;
  final bool piCreator;

  const UserModel({
    required this.id,
    required this.username,
    required this.displayName,
    required this.avatarUrl,
    required this.verified,
    required this.piCreator,
  });
}