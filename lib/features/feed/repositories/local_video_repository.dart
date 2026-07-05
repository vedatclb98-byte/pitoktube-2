import '../models/video_model.dart';
import 'feed_repository.dart';
import 'video_repository.dart';

class LocalVideoRepository implements VideoRepository {
  final FeedRepository _feedRepository = FeedRepository();

  @override
  Future<List<VideoModel>> getFeed() async {
    return _feedRepository.getVideos();
  }

  @override
  Future<VideoModel?> getVideo(String id) async {
    final videos = _feedRepository.getVideos();

    try {
      return videos.firstWhere((video) => video.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> uploadVideo(VideoModel video) async {}

  @override
  Future<void> deleteVideo(String id) async {}
}