import 'video_source.dart';

class VideoModel {
  final String id;
  final String username;
  final String description;
  final VideoSource source;
  final int likes;
  final int comments;
  final int views;
  final bool verified;

  const VideoModel({
    required this.id,
    required this.username,
    required this.description,
    required this.source,
    required this.likes,
    required this.comments,
    required this.views,
    required this.verified,
  });
}