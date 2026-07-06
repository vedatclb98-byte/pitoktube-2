class VideoModel {
  final String id;
  final String userId;
  final String username;
  final String userPhotoUrl;

  final String videoUrl;
  final String description;

  final int likes;
  final int comments;

  final int views;
  final int watchTime;

  // 🔥 TRENDING SCORE
  final int trendingScore;

  final DateTime createdAt;

  VideoModel({
    required this.id,
    required this.userId,
    required this.username,
    required this.userPhotoUrl,
    required this.videoUrl,
    required this.description,
    required this.likes,
    required this.comments,
    required this.views,
    required this.watchTime,
    required this.trendingScore,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "userId": userId,
      "username": username,
      "userPhotoUrl": userPhotoUrl,
      "videoUrl": videoUrl,
      "description": description,
      "likes": likes,
      "comments": comments,
      "views": views,
      "watchTime": watchTime,
      "trendingScore": trendingScore,
      "createdAt": createdAt.toIso8601String(),
    };
  }

  factory VideoModel.fromMap(Map<String, dynamic> map) {
    return VideoModel(
      id: map["id"],
      userId: map["userId"],
      username: map["username"],
      userPhotoUrl: map["userPhotoUrl"] ?? "",
      videoUrl: map["videoUrl"],
      description: map["description"],
      likes: map["likes"],
      comments: map["comments"],
      views: map["views"] ?? 0,
      watchTime: map["watchTime"] ?? 0,
      trendingScore: map["trendingScore"] ?? 0,
      createdAt: DateTime.parse(map["createdAt"]),
    );
  }
}