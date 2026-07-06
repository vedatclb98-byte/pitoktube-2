class VideoModel {
  final String id;
  final String userId;
  final String username;
  final String userPhotoUrl; // 👈 YENİ EKLENDİ
  final String videoUrl;
  final String description;
  final int likes;
  final int comments;
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
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "userId": userId,
      "username": username,
      "userPhotoUrl": userPhotoUrl, // 👈 YENİ
      "videoUrl": videoUrl,
      "description": description,
      "likes": likes,
      "comments": comments,
      "createdAt": createdAt.toIso8601String(),
    };
  }

  factory VideoModel.fromMap(Map<String, dynamic> map) {
    return VideoModel(
      id: map["id"],
      userId: map["userId"],
      username: map["username"],
      userPhotoUrl: map["userPhotoUrl"] ?? "", // 👈 YENİ
      videoUrl: map["videoUrl"],
      description: map["description"],
      likes: map["likes"],
      comments: map["comments"],
      createdAt: DateTime.parse(map["createdAt"]),
    );
  }
}