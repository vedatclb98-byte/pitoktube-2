await _firestore.collection("notifications").add({
  "userId": videoOwnerId,
  "fromUserId": currentUserId,
  "type": "comment",
  "message": "videona yorum yaptı",
  "createdAt": DateTime.now().toIso8601String(),
});