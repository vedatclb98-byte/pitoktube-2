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
            "Genel İstatistikler",
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
            Colors.blue,
          ),

          const SizedBox(height: 16),

          _buildMetric(
            "Toplam Beğeni",
            "84.9K",
            Icons.favorite,
            Colors.red,
          ),

          const SizedBox(height: 16),

          _buildMetric(
            "Toplam Yorum",
            "15.2K",
            Icons.chat,
            Colors.green,
          ),

          const SizedBox(height: 16),

          _buildMetric(
            "Toplam Pi Geliri",
            "32.50 Pi",
            Icons.currency_exchange,
            Colors.orange,
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

          _videoCard(
            "PitokTube Tanıtımı",
            "842K görüntülenme",
          ),

          const SizedBox(height: 12),

          _videoCard(
            "Pi Network Rehberi",
            "412K görüntülenme",
          ),

          const SizedBox(height: 12),

          _videoCard(
            "Flutter Dersleri",
            "196K görüntülenme",
          ),

          const SizedBox(height: 30),

          const Text(
            "Creator Score",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFF15151C),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              children: [
                const Text(
                  "820 / 1000",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7C3AED),
                  ),
                ),

                const SizedBox(height: 12),

                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: const LinearProgressIndicator(
                    value: 0.82,
                    minHeight: 10,
                  ),
                ),

                const SizedBox(height: 12),

                const Text(
                  "Harika gidiyorsun! Creator Level 2 için 180 puan kaldı.",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),
                    const Text(
            "Son 7 Gün Performansı",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFF15151C),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Pzt"),
                    Text("120K"),
                  ],
                ),
                SizedBox(height: 10),
                LinearProgressIndicator(value: 0.25),

                SizedBox(height: 14),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Sal"),
                    Text("240K"),
                  ],
                ),
                SizedBox(height: 10),
                LinearProgressIndicator(value: 0.50),

                SizedBox(height: 14),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Çar"),
                    Text("380K"),
                  ],
                ),
                SizedBox(height: 10),
                LinearProgressIndicator(value: 0.76),

                SizedBox(height: 14),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Per"),
                    Text("510K"),
                  ],
                ),
                SizedBox(height: 10),
                LinearProgressIndicator(value: 1.0),
              ],
            ),
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }
    Widget _buildMetric(
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

  Widget _videoCard(
    String title,
    String views,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF15151C),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: const Color(0xFF7C3AED),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: 36,
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
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  views,
                  style: const TextStyle(
                    color: Colors.grey,
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