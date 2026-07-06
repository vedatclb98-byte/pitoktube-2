import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/video_model.dart';

class VideoRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // 🔥 FOR YOU FEED (YOUTUBE STYLE)
  Stream<List<VideoModel>> getForYouFeed() {
    return _firestore
        .collection("videos")
        .snapshots()
        .map((snapshot) {
      final videos = snapshot.docs
          .map((doc) => VideoModel.fromMap(doc.data()))
          .toList();

      videos.sort((a, b) {
        return _score(b).compareTo(_score(a));
      });

      return videos;
    });
  }

  double _score(VideoModel v) {
    return (v.likes * 3) +
        (v.comments * 5) +
        (v.views * 1) +
        (v.watchTime * 0.1);
  }

  Future<void> uploadVideo(VideoModel video) async {
    await _firestore.collection("videos").add(video.toMap());
  }
}