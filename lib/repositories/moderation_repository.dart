import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/report_model.dart';

class ModerationRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // 📩 REPORT SEND
  Future<void> reportVideo(ReportModel report) async {
    await _firestore.collection("reports").add(report.toMap());
  }

  // 🚫 AUTO BLOCK (fake engagement detection)
  Future<void> checkSpam(String userId) async {
    final likes = await _firestore
        .collection("videos")
        .where("userId", isEqualTo: userId)
        .get();

    int totalLikes = 0;

    for (var v in likes.docs) {
      totalLikes += (v.data()["likes"] ?? 0);
    }

    // 🚨 SIMPLE ANTI-SPAM RULE
    if (totalLikes > 1000000) {
      await _firestore.collection("banned_users").doc(userId).set({
        "reason": "suspicious engagement",
        "createdAt": DateTime.now().toIso8601String(),
      });
    }
  }

  // 👁 CONTENT REMOVAL
  Future<void> deleteVideo(String videoId) async {
    await _firestore.collection("videos").doc(videoId).delete();
  }
}