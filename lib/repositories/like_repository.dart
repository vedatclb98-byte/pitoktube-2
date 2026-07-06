await _firestore.collection("notifications").add({
  "userId": videoOwnerId, // video sahibi
  "fromUserId": currentUserId,
  "type": "like",
  "message": "videonu beğendi",
  "createdAt": DateTime.now().toIso8601String(),
});