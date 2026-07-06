class FollowModel {
  final String followerId;
  final String followingId;
  final DateTime createdAt;

  const FollowModel({
    required this.followerId,
    required this.followingId,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'followerId': followerId,
      'followingId': followingId,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory FollowModel.fromMap(Map<String, dynamic> map) {
    return FollowModel(
      followerId: map['followerId'] ?? '',
      followingId: map['followingId'] ?? '',
      createdAt: DateTime.parse(
        map['createdAt'] ?? DateTime.now().toIso8601String(),
      ),
    );
  }
}