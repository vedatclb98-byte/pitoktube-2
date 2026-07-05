import '../models/video_model.dart';

abstract class VideoRepository {
  Future<List<VideoModel>> getFeed();

  Future<VideoModel?> getVideo(String id);

  Future<void> uploadVideo(VideoModel video);

  Future<void> deleteVideo(String id);
}