import 'package:cloud_firestore/cloud_firestore.dart';

class VideoEngagementService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // 👁 VIEW EKLE
  Future<void> addView(String videoId) async {
    final ref = _firestore.collection("videos").doc(videoId);

    await ref.update({
      "views": FieldValue.increment(1),
    });
  }

  // ⏱ WATCH TIME EKLE
  Future<void> addWatchTime(String videoId, int seconds) async {
    final ref = _firestore.collection("videos").doc(videoId);

    await ref.update({
      "watchTime": FieldValue.increment(seconds),
    });
  }
}