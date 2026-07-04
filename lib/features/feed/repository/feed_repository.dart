import '../models/video_model.dart';

class FeedRepository {
  List<VideoModel> getVideos() {
    return [
      const VideoModel(
        id: "1",
        username: "@pitoktube",
        description: "PitokTube'a hoş geldiniz 🚀",
        videoUrl: "",
        likes: 1452,
        comments: 231,
        verified: true,
      ),
    ];
  }
}