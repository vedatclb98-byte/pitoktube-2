import 'package:cloud_firestore/cloud_firestore.dart';

class TrendingEngine {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // ⚡ REAL-TIME SCORE UPDATE
  Future<void> updateTrendingScore(String videoId) async {
    final doc = await _firestore
        .collection("videos")
        .doc(videoId)
        .get();

    if (!doc.exists) return;

    final data = doc.data()!;

    final likes = data["likes"] ?? 0;
    final comments = data["comments"] ?? 0;
    final views = data["views"] ?? 0;
    final watchTime = data["watchTime"] ?? 0;
    final createdAt = DateTime.parse(data["createdAt"]);

    final hoursAge =
        DateTime.now().difference(createdAt).inHours.clamp(1, 9999);

    final score = _calculateScore(
      likes: likes,
      comments: comments,
      views: views,
      watchTime: watchTime,
      ageHours: hoursAge,
    );

    await _firestore.collection("videos").doc(videoId).update({
      "trendingScore": score,
    });
  }

  // 📊 FORMÜL
  int _calculateScore({
    required int likes,
    required int comments,
    required int views,
    required int watchTime,
    required int ageHours,
  }) {
    final rawScore =
        (likes * 4) +
        (comments * 6) +
        (views * 2) +
        (watchTime * 3);

    return (rawScore / ageHours).round();
  }
}