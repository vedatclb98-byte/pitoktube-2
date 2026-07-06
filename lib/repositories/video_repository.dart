import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/video_model.dart';

class VideoRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // 🔥 REAL-TIME FEED
  Stream<List<VideoModel>> getFeedStream() {
    return _firestore
        .collection("videos")
        .orderBy("createdAt", descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return VideoModel.fromMap(doc.data());
      }).toList();
    });
  }

  // Upload
  Future<void> uploadVideo(VideoModel video) async {
    await _firestore.collection("videos").add(video.toMap());
  }
}