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

  // 🔔 NOTIFICATION EKLENDİ
  await _firestore.collection("notifications").add({
    "userId": targetUserId, // bildirimi alan
    "fromUserId": currentUserId,
    "type": "follow",
    "message": "seni takip etti",
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
