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
}