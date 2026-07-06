import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/admin_stats_model.dart';

class AdminRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // 📊 PLATFORM STATS
  Future<AdminStatsModel> getStats() async {
    final users = await _firestore.collection("users").get();
    final videos = await _firestore.collection("videos").get();
    final reports = await _firestore.collection("reports").get();

    int totalViews = 0;

    for (var v in videos.docs) {
      totalViews += (v.data()["views"] ?? 0);
    }

    return AdminStatsModel(
      totalUsers: users.docs.length,
      totalVideos: videos.docs.length,
      totalViews: totalViews,
      totalReports: reports.docs.length,
    );
  }

  // 🚫 VIDEO SİLME
  Future<void> deleteVideo(String videoId) async {
    await _firestore.collection("videos").doc(videoId).delete();
  }

  // 🚫 USER BAN
  Future<void> banUser(String userId) async {
    await _firestore.collection("banned_users").doc(userId).set({
      "createdAt": DateTime.now().toIso8601String(),
      "reason": "admin action",
    });
  }

  // 🟢 UNBAN
  Future<void> unbanUser(String userId) async {
    await _firestore.collection("banned_users").doc(userId).delete();
  }
}