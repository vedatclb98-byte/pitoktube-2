import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bildirimler"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildNotification(
            icon: Icons.favorite,
            color: Colors.red,
            title: "Yeni Beğeni",
            subtitle: "@pitube videonu beğendi.",
            time: "2 dk önce",
          ),

          const SizedBox(height: 12),

          _buildNotification(
            icon: Icons.chat,
            color: Colors.blue,
            title: "Yeni Yorum",
            subtitle: "Harika video! 🔥",
            time: "10 dk önce",
          ),

          const SizedBox(height: 12),

          _buildNotification(
            icon: Icons.person_add,
            color: Colors.green,
            title: "Yeni Takipçi",
            subtitle: "@crypto_pi seni takip etti.",
            time: "30 dk önce",
          ),

          const SizedBox(height: 12),
                    _buildNotification(
            icon: Icons.currency_exchange,
            color: Colors.orange,
            title: "Pi Bahşişi",
            subtitle: "5 Pi bahşiş aldın. 🎉",
            time: "1 saat önce",
          ),

          const SizedBox(height: 12),

          _buildNotification(
            icon: Icons.live_tv,
            color: Colors.purple,
            title: "Canlı Yayın",
            subtitle: "@pitoktube canlı yayına başladı.",
            time: "2 saat önce",
          ),

          const SizedBox(height: 12),

          _buildNotification(
            icon: Icons.workspace_premium,
            color: Color(0xFF7C3AED),
            title: "Creator Rozeti",
            subtitle: "Tebrikler! Yeni Creator seviyesine ulaştın.",
            time: "Bugün",
          ),
        ],
      ),
    );
  }

  Widget _buildNotification({
    required IconData icon,
    required Color color,
    required String title,
    required String subtitle,
    required String time,
  }) {
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
            backgroundColor: color.withOpacity(0.15),
            child: Icon(
              icon,
              color: color,
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 4),

                Text(subtitle),
                                const SizedBox(height: 4),

                Text(
                  time,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}