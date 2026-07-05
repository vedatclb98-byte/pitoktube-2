import '../models/notification_model.dart';

class NotificationRepository {
  List<NotificationModel> getNotifications() {
    return [
      NotificationModel(
        id: "1",
        title: "Yeni Takipçi",
        message: "@flutterdev seni takip etmeye başladı.",
        type: NotificationType.follow,
        createdAt: DateTime.now(),
        isRead: false,
      ),
      NotificationModel(
        id: "2",
        title: "Yeni Bahşiş",
        message: "@pitoktube sana 2.5 Pi gönderdi.",
        type: NotificationType.tip,
        createdAt: DateTime.now(),
        isRead: false,
      ),
    ];
  }
}