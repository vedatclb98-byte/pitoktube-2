import '../models/notification_model.dart';

class NotificationRepository {
  Future<List<NotificationModel>> getNotifications() async {
    await Future.delayed(const Duration(milliseconds: 400));

    return [
      NotificationModel(
        id: "1",
        title: "Yeni Takipçi",
        message: "@piuser seni takip etmeye başladı.",
        type: NotificationType.follow,
        createdAt: DateTime.now(),
        isRead: false,
      ),
      NotificationModel(
        id: "2",
        title: "Yeni Beğeni",
        message: "Videon 120 yeni beğeni aldı.",
        type: NotificationType.like,
        createdAt: DateTime.now(),
        isRead: false,
      ),
      NotificationModel(
        id: "3",
        title: "Pi Tip",
        message: "2.5 Pi bahşiş aldın.",
        type: NotificationType.tip,
        createdAt: DateTime.now(),
        isRead: true,
      ),
    ];
  }
}