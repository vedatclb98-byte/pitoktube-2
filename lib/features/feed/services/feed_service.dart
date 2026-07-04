import '../models/video_model.dart';
import '../repository/feed_repository.dart';

class FeedService {
  final FeedRepository _repository = FeedRepository();

  List<VideoModel> loadFeed() {
    return _repository.getVideos();
  }
}