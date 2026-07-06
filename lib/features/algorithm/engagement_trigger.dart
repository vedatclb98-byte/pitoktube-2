import 'package:cloud_firestore/cloud_firestore.dart';
import 'trending_engine.dart';

class EngagementTrigger {
  final TrendingEngine _engine = TrendingEngine();

  // ❤️ LIKE OLUNCA
  Future<void> onLike(String videoId) async {
    final ref =
        FirebaseFirestore.instance.collection("videos").doc(videoId);

    await ref.update({
      "likes": FieldValue.increment(1),
    });

    await _engine.updateTrendingScore(videoId);
  }

  // 👀 VIEW OLUNCA
  Future<void> onView(String videoId) async {
    final ref =
        FirebaseFirestore.instance.collection("videos").doc(videoId);

    await ref.update({
      "views": FieldValue.increment(1),
    });

    await _engine.updateTrendingScore(videoId);
  }

  // 💬 COMMENT OLUNCA
  Future<void> onComment(String videoId) async {
    final ref =
        FirebaseFirestore.instance.collection("videos").doc(videoId);

    await ref.update({
      "comments": FieldValue.increment(1),
    });

    await _engine.updateTrendingScore(videoId);
  }
}