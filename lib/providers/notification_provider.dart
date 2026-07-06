import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repositories/notification_repository.dart';
import '../models/notification_model.dart';

final notificationRepositoryProvider =
    Provider<NotificationRepository>((ref) {
  return NotificationRepository();
});

final notificationsProvider =
    StreamProvider.family<List<NotificationModel>, String>((ref, userId) {
  final repo = ref.read(notificationRepositoryProvider);
  return repo.getNotifications(userId);
});