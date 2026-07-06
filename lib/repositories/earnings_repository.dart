import 'package:cloud_firestore/cloud_firestore.dart';
import '../features/monetization/earnings_service.dart';

class EarningsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final EarningsService _service = EarningsService();

  Future<void> updateEarnings(String userId) async {
    final videos = await _firestore
        .collection("videos")
        .where("userId", isEqualTo: userId)
        .get();

    int views = 0;
    int watchTime = 0;
    int likes = 0;
    int comments = 0;

    for (var v in videos.docs) {
      final data = v.data();

      views += (data["views"] ?? 0);
      watchTime += (data["watchTime"] ?? 0);
      likes += (data["likes"] ?? 0);
      comments += (data["comments"] ?? 0);
    }

    final earnings = _service.calculateEarnings(
      views: views,
      watchTime: watchTime,
      likes: likes,
      comments: comments,
    );

    await _firestore.collection("earnings").doc(userId).set({
      "userId": userId,
      "piBalance": earnings,
      "views": views,
      "watchTime": watchTime,
      "likes": likes,
      "comments": comments,
    });
  }
}