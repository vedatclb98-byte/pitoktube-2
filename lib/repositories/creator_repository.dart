import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/video_model.dart';

class CreatorRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // 📊 CREATOR VIDEOS
  Stream<List<VideoModel>> getMyVideos(String userId) {
    return _firestore
        .collection("videos")
        .where("userId", isEqualTo: userId)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => VideoModel.fromMap(doc.data()))
          .toList();
    });
  }

  // 📈 TOTAL STATS
  Future<Map<String, int>> getStats(String userId) async {
    final videos = await _firestore
        .collection("videos")
        .where("userId", isEqualTo: userId)
        .get();

    int totalViews = 0;
    int totalLikes = 0;
    int totalComments = 0;

    for (var doc in videos.docs) {
      final data = doc.data();

      totalViews += (data["views"] ?? 0) as int;
      totalLikes += (data["likes"] ?? 0) as int;
      totalComments += (data["comments"] ?? 0) as int;
    }

    return {
      "views": totalViews,
      "likes": totalLikes,
      "comments": totalComments,
    };
  }
}