import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/video_model.dart';

class VideoRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<VideoModel>> getFeed() async {
    final snapshot = await _firestore
        .collection("videos")
        .orderBy("createdAt", descending: true)
        .get();

    return snapshot.docs
        .map((doc) => VideoModel.fromMap(doc.data()))
        .toList();
  }

  Future<void> uploadVideo(VideoModel video) async {
    await _firestore.collection("videos").add(video.toMap());
  }
}