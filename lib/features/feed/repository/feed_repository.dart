import '../models/video_model.dart';
import '../models/video_source.dart';

class FeedRepository {
  List<VideoModel> getVideos() {
    return [
      const VideoModel(
        id: "1",
        username: "@pitoktube",
        description: "PitokTube'a hoş geldiniz 🚀",

        source: VideoSource(
          url: "",
          type: VideoSourceType.asset,
        ),

        likes: 1452,
        comments: 231,
        views: 1250000,
        verified: true,
      ),
    ];
  }
}