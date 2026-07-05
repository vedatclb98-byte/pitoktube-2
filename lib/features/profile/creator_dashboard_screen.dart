import 'package:flutter/material.dart';

class CreatorDashboardScreen extends StatelessWidget {
  const CreatorDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Creator Dashboard"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            "İstatistikler",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          _buildCard(
            "Toplam İzlenme",
            "1.25M",
            Icons.visibility,
            Colors.blue,
          ),

          const SizedBox(height: 16),

          _buildCard(
            "Takipçiler",
            "12.4K",
            Icons.people,
            Colors.green,
          ),

          const SizedBox(height: 16),

          _buildCard(
            "Toplam Pi Kazancı",
            "32.50 Pi",
            Icons.currency_exchange,
            Colors.orange,
          ),

          const SizedBox(height: 16),

          _buildCard(
            "Creator Level",
            "Level 1",
            Icons.workspace_premium,
            Colors.purple,
          ),

          const SizedBox(height: 30),

          const Text(
            "Son 7 Gün",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          _buildSmallStat(
            "Yeni Takipçi",
            "+245",
            Icons.person_add,
          ),

          const SizedBox(height: 12),

          _buildSmallStat(
            "Yeni Beğeni",
            "+3.2K",
            Icons.favorite,
          ),

          const SizedBox(height: 12),

          _buildSmallStat(
            "Yeni Yorum",
            "+584",
            Icons.chat,
          ),

          const SizedBox(height: 12),

          _buildSmallStat(
            "Kazanılan Pi",
            "+2.35 Pi",
            Icons.currency_exchange,
          ),
        ],
      ),
    );
  }

  Widget _buildCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
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
            backgroundColor: color.withOpacity(0.15),
            child: Icon(
              icon,
              color: color,
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
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSmallStat(
    String title,
    String value,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF15151C),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color(0xFF7C3AED),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Text(title),
          ),

          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF7C3AED),
            ),
          ),
        ],
      ),
    );
  }
}