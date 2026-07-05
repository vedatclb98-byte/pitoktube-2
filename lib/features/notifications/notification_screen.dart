import 'package:flutter/material.dart';

import 'services/notification_service.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final NotificationService _service =
      NotificationService();

  @override
  Widget build(BuildContext context) {
    final notifications = _service.getNotifications();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Bildirimler"),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final item = notifications[index];

          return ListTile(
            leading: const CircleAvatar(
              backgroundColor: Color(0xFF7C3AED),
              child: Icon(
                Icons.notifications,
                color: Colors.white,
              ),
            ),
            title: Text(item.title),
            subtitle: Text(item.message),
          );
        },
      ),
    );
  }
}