class CommentModel {
  final String id;
  final String videoId;
  final String userId;
  final String username;
  final String text;
  final DateTime createdAt;
  final int likes;

  const CommentModel({
    required this.id,
    required this.videoId,
    required this.userId,
    required this.username,
    required this.text,
    required this.createdAt,
    required this.likes,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'videoId': videoId,
      'userId': userId,
      'username': username,
      'text': text,
      'createdAt': createdAt.toIso8601String(),
      'likes': likes,
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      id: map['id'] ?? '',
      videoId: map['videoId'] ?? '',
      userId: map['userId'] ?? '',
      username: map['username'] ?? '',
      text: map['text'] ?? '',
      createdAt: DateTime.parse(
        map['createdAt'] ?? DateTime.now().toIso8601String(),
      ),
      likes: map['likes'] ?? 0,
    );
  }
}