import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/video_model.dart';

class VideoRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // 🧠 PERSONAL FOR YOU FEED
  Stream<List<VideoModel>> getPersonalFeed({
    required String userId,
  }) {
    return _firestore.collection("videos").snapshots().map((snapshot) {
      final videos = snapshot.docs
          .map((doc) => VideoModel.fromMap(doc.data()))
          .toList();

      videos.sort((a, b) {
        return _personalScore(b, userId)
            .compareTo(_personalScore(a, userId));
      });

      return videos;
    });
  }

  // 📊 PERSONAL AI SCORE
  double _personalScore(VideoModel v, String userId) {
    double score = 0;

    score += v.likes * 3;
    score += v.comments * 5;
    score += v.views * 1;
    score += v.watchTime * 0.2;

    // 👤 creator boost
    if (v.userId == userId) {
      score += 50;
    }

    return score;
  }

  Future<void> uploadVideo(VideoModel video) async {
    await _firestore.collection("videos").add(video.toMap());
  }
}