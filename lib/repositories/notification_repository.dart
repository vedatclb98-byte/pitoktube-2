import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/notification_model.dart';

class NotificationRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> sendNotification(NotificationModel notification) async {
    await _firestore
        .collection("notifications")
        .add(notification.toMap());
  }

  Stream<List<NotificationModel>> getNotifications(String userId) {
    return _firestore
        .collection("notifications")
        .where("userId", isEqualTo: userId)
        .orderBy("createdAt", descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => NotificationModel.fromMap(doc.data()))
          .toList();
    });
  }
}