class VideoModel {
  final String id;
  final String username;
  final String description;
  final String videoUrl;
  final int likes;
  final int comments;

  const VideoModel({
    required this.id,
    required this.username,
    required this.description,
    required this.videoUrl,
    required this.likes,
    required this.comments,
  });
}