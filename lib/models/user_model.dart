import 'user_role.dart';

class UserModel {
  final String id;
  final String username;
  final String displayName;
  final String? photoUrl;
  final String bio;

  final bool verified;
  final bool kycVerified;

  final int followers;
  final int following;
  final int likes;

  final double piBalance;

  final UserRole role;

  const UserModel({
    required this.id,
    required this.username,
    required this.displayName,
    this.photoUrl,
    required this.bio,
    required this.verified,
    required this.kycVerified,
    required this.followers,
    required this.following,
    required this.likes,
    required this.piBalance,
    required this.role,
  });

  UserModel copyWith({
    String? id,
    String? username,
    String? displayName,
    String? photoUrl,
    String? bio,
    bool? verified,
    bool? kycVerified,
    int? followers,
    int? following,
    int? likes,
    double? piBalance,
    UserRole? role,
  }) {
    return UserModel(
      id: id ?? this.id,
      username: username ?? this.username,
      displayName: displayName ?? this.displayName,
      photoUrl: photoUrl ?? this.photoUrl,
      bio: bio ?? this.bio,
      verified: verified ?? this.verified,
      kycVerified: kycVerified ?? this.kycVerified,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      likes: likes ?? this.likes,
      piBalance: piBalance ?? this.piBalance,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'displayName': displayName,
      'photoUrl': photoUrl,
      'bio': bio,
      'verified': verified,
      'kycVerified': kycVerified,
      'followers': followers,
      'following': following,
      'likes': likes,
      'piBalance': piBalance,
      'role': role.name,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      username: map['username'] ?? '',
      displayName: map['displayName'] ?? '',
      photoUrl: map['photoUrl'],
      bio: map['bio'] ?? '',
      verified: map['verified'] ?? false,
      kycVerified: map['kycVerified'] ?? false,
      followers: map['followers'] ?? 0,
      following: map['following'] ?? 0,
      likes: map['likes'] ?? 0,
      piBalance: (map['piBalance'] ?? 0).toDouble(),
      role: UserRole.values.firstWhere(
        (e) => e.name == (map['role'] ?? 'pioneer'),
        orElse: () => UserRole.pioneer,
      ),
    );
  }

  @override
  String toString() {
    return 'UserModel('
        'id: $id, '
        'username: $username, '
        'displayName: $displayName, '
        'verified: $verified, '
        'kycVerified: $kycVerified, '
        'followers: $followers, '
        'following: $following, '
        'likes: $likes, '
        'piBalance: $piBalance, '
        'role: $role'
        ')';
  }
}