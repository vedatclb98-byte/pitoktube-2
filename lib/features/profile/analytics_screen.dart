import 'package:flutter/material.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Analytics"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            "Son 30 Gün",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          _buildMetric(
            "Toplam İzlenme",
            "1.25M",
            Icons.visibility,
          ),

          const SizedBox(height: 12),

          _buildMetric(
            "İzlenme Süresi",
            "48.2K saat",
            Icons.schedule,
          ),

          const SizedBox(height: 12),

          _buildMetric(
            "Takipçi Artışı",
            "+1.2K",
            Icons.people,
          ),

          const SizedBox(height: 12),

          _buildMetric(
            "Pi Geliri",
            "12.6 Pi",
            Icons.currency_exchange,
          ),

          const SizedBox(height: 30),

          const Text(
            "En Popüler Videolar",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          _videoCard("PitokTube Tanıtımı", "425K görüntülenme"),
          _videoCard("Pi Network Rehberi", "287K görüntülenme"),
          _videoCard("Flutter Dersleri", "196K görüntülenme"),
        ],
      ),
    );
  }

  Widget _buildMetric(
    String title,
    String value,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF15151C),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color(0xFF7C3AED),
          ),
          const SizedBox(width: 15),
          Expanded(child: Text(title)),
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

  Widget _videoCard(String title, String views) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.play_circle_fill),
        title: Text(title),
        subtitle: Text(views),
      ),
    );
  }
}