import 'package:flutter/material.dart';

class AchievementsScreen extends StatelessWidget {
  const AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Başarı Rozetleri"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildBadge(
            icon: Icons.workspace_premium,
            color: Colors.purple,
            title: "Pi Creator",
            description: "İlk Creator rozetini kazandın.",
            earned: true,
          ),

          const SizedBox(height: 16),

          _buildBadge(
            icon: Icons.verified,
            color: Colors.blue,
            title: "Verified Creator",
            description: "Hesabın doğrulandı.",
            earned: true,
          ),

          const SizedBox(height: 16),

          _buildBadge(
            icon: Icons.local_fire_department,
            color: Colors.orange,
            title: "Viral Video",
            description: "1 milyon görüntülenmeye ulaştın.",
            earned: false,
          ),

          const SizedBox(height: 16),
                    _buildBadge(
            icon: Icons.star,
            color: Colors.amber,
            title: "Top Creator",
            description: "100.000 takipçiye ulaş.",
            earned: false,
          ),

          const SizedBox(height: 16),

          _buildBadge(
            icon: Icons.currency_exchange,
            color: Colors.green,
            title: "100 Pi Club",
            description: "Toplam 100 Pi bahşiş kazan.",
            earned: false,
          ),

          const SizedBox(height: 16),

          _buildBadge(
            icon: Icons.movie_creation,
            color: Colors.red,
            title: "100 Video",
            description: "100 video yayınla.",
            earned: false,
          ),
        ],
      ),
    );
  }

  Widget _buildBadge({
    required IconData icon,
    required Color color,
    required String title,
    required String description,
    required bool earned,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF15151C),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: earned
                ? color.withOpacity(0.15)
                : Colors.grey.withOpacity(0.15),
            child: Icon(
              icon,
              color: earned ? color : Colors.grey,
            ),
          ),

          const SizedBox(width: 18),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                Text(description),
                                const SizedBox(height: 8),

                Row(
                  children: [
                    Icon(
                      earned
                          ? Icons.check_circle
                          : Icons.lock_outline,
                      size: 18,
                      color: earned
                          ? Colors.green
                          : Colors.grey,
                    ),

                    const SizedBox(width: 6),

                    Text(
                      earned ? "Kazanıldı" : "Kilitli",
                      style: TextStyle(
                        color: earned
                            ? Colors.green
                            : Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}