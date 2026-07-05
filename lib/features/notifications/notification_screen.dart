import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      {
        "icon": Icons.favorite,
        "color": Colors.red,
        "title": "Pi Creator videonu beğendi ❤️",
        "time": "2 dk önce",
      },
      {
        "icon": Icons.comment,
        "color": Colors.blue,
        "title": "Yeni yorum aldın 💬",
        "time": "15 dk önce",
      },
      {
        "icon": Icons.person_add,
        "color": Colors.green,
        "title": "Yeni takipçin var 👤",
        "time": "1 saat önce",
      },
      {
        "icon": Icons.currency_exchange,
        "color": Colors.orange,
        "title": "2.50 Pi bahşiş aldın 🪙",
        "time": "Bugün",
      },
      {
        "icon": Icons.workspace_premium,
        "color": Colors.purple,
        "title": "Creator Level XP kazandın 🚀",
        "time": "Dün",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Bildirimler"),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        separatorBuilder: (_, __) =>
            const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final item = notifications[index];
                    return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF15151C),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor:
                      (item["color"] as Color).withOpacity(0.15),
                  child: Icon(
                    item["icon"] as IconData,
                    color: item["color"] as Color,
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        item["title"] as String,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Text(
                        item["time"] as String,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),

                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.chevron_right),
                ),
              ],
            ),
          );
                  },
      ),
    );
  }
}