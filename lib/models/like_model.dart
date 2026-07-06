class LikeModel {
  final String userId;
  final String videoId;
  final DateTime createdAt;

  const LikeModel({
    required this.userId,
    required this.videoId,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'videoId': videoId,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory LikeModel.fromMap(Map<String, dynamic> map) {
    return LikeModel(
      userId: map['userId'] ?? '',
      videoId: map['videoId'] ?? '',
      createdAt: DateTime.parse(
        map['createdAt'] ?? DateTime.now().toIso8601String(),
      ),
    );
  }
}