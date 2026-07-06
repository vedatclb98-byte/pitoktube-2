import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/video_model.dart';

class VideoRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // 🔥 TRENDING FEED
  Stream<List<VideoModel>> getTrendingFeed() {
    return _firestore.collection("videos").snapshots().map((snapshot) {
      final videos = snapshot.docs
          .map((doc) => VideoModel.fromMap(doc.data()))
          .toList();

      videos.sort((a, b) {
        return _calculateTrendingScore(b)
            .compareTo(_calculateTrendingScore(a));
      });

      return videos;
    });
  }

  // 📊 TREND SCORE FORMÜLÜ
  int _calculateTrendingScore(VideoModel v) {
    final ageHours = DateTime.now()
        .difference(v.createdAt)
        .inHours
        .clamp(1, 9999);

    return (
      (v.likes * 4) +
      (v.comments * 6) +
      (v.views * 2) +
      (v.watchTime * 3)
    ) ~/ ageHours;
  }

  Future<void> uploadVideo(VideoModel video) async {
    await _firestore.collection("videos").add(video.toMap());
  }
}