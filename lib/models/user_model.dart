class UserModel {
  final String id;
  final String email;
  final String username;
  final String photoUrl;
  final String bio;
  final DateTime createdAt;

  UserModel({
    required this.id,
    required this.email,
    required this.username,
    required this.photoUrl,
    required this.bio,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "email": email,
      "username": username,
      "photoUrl": photoUrl,
      "bio": bio,
      "createdAt": createdAt.toIso8601String(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map["id"],
      email: map["email"],
      username: map["username"],
      photoUrl: map["photoUrl"],
      bio: map["bio"],
      createdAt: DateTime.parse(map["createdAt"]),
    );
  }
}