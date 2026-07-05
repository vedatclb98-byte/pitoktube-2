class CommentModel {
  final String id;
  final String userId;
  final String username;
  final String text;
  final DateTime createdAt;
  final int likes;

  const CommentModel({
    required this.id,
    required this.userId,
    required this.username,
    required this.text,
    required this.createdAt,
    required this.likes,
  });
}