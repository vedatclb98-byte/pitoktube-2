import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/video_model.dart';

class VideoRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // ⚡ REAL-TIME TRENDING FEED
  Stream<List<VideoModel>> getLiveTrendingFeed() {
    return _firestore
        .collection("videos")
        .orderBy("trendingScore", descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => VideoModel.fromMap(doc.data()))
          .toList();
    });
  }

  // 🧠 OPTIONAL: FOR YOU FEED (fallback)
  Stream<List<VideoModel>> getForYouFeed() {
    return _firestore
        .collection("videos")
        .snapshots()
        .map((snapshot) {
      final videos = snapshot.docs
          .map((doc) => VideoModel.fromMap(doc.data()))
          .toList();

      videos.sort((a, b) {
        final scoreA = _score(a);
        final scoreB = _score(b);
        return scoreB.compareTo(scoreA);
      });

      return videos;
    });
  }

  // 📊 BASIC SCORE (fallback algorithm)
  double _score(VideoModel v) {
    return (v.likes * 3) +
        (v.comments * 5) +
        (v.views * 1) +
        (v.watchTime * 0.2);
  }

  Future<void> uploadVideo(VideoModel video) async {
    await _firestore.collection("videos").add(video.toMap());
  }
}