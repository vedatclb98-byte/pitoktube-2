import 'package:cloud_firestore/cloud_firestore.dart';

class FollowRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> followUser({
    required String currentUserId,
    required String targetUserId,
  }) async {
    await _firestore
        .collection("follows")
        .doc("${currentUserId}_$targetUserId")
        .set({
      "followerId": currentUserId,
      "followingId": targetUserId,
      "createdAt": DateTime.now().toIso8601String(),
    });
  }

  Future<void> unfollowUser({
    required String currentUserId,
    required String targetUserId,
  }) async {
    await _firestore
        .collection("follows")
        .doc("${currentUserId}_$targetUserId")
        .delete();
  }

  Future<bool> isFollowing({
    required String currentUserId,
    required String targetUserId,
  }) async {
    final doc = await _firestore
        .collection("follows")
        .doc("${currentUserId}_$targetUserId")
        .get();

    return doc.exists;
  }

  Future<int> getFollowersCount(String userId) async {
    final snapshot = await _firestore
        .collection("follows")
        .where("followingId", isEqualTo: userId)
        .get();

    return snapshot.docs.length;
  }

  Future<int> getFollowingCount(String userId) async {
    final snapshot = await _firestore
        .collection("follows")
        .where("followerId", isEqualTo: userId)
        .get();

    return snapshot.docs.length;
  }
}