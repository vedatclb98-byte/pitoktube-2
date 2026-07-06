import '../features/feed/models/video_model.dart';

class VideoRepository {
  Future<List<VideoModel>> getFeed() async {
    await Future.delayed(const Duration(milliseconds: 500));

    return const [
      VideoModel(
        id: "1",
        username: "@pitoktube",
        description: "PitokTube'a hoş geldiniz 🚀",
        videoUrl: "",
        likes: 1452,
        comments: 231,
        views: 1250000,
        verified: true,
      ),
      VideoModel(
        id: "2",
        username: "@pi_creator",
        description: "Pi Network hakkında son gelişmeler",
        videoUrl: "",
        likes: 987,
        comments: 154,
        views: 89500,
        verified: true,
      ),
      VideoModel(
        id: "3",
        username: "@flutterdev",
        description: "Flutter ile kısa video uygulaması geliştiriyoruz 💜",
        videoUrl: "",
        likes: 2150,
        comments: 312,
        views: 156000,
        verified: false,
      ),
    ];
  }
}