import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/creator_provider.dart';
import '../feed/widgets/video_card.dart';

class CreatorDashboardScreen extends ConsumerWidget {
  final String userId;

  const CreatorDashboardScreen({
    super.key,
    required this.userId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videos = ref.watch(myVideosProvider(userId));
    final stats = ref.watch(creatorStatsProvider(userId));

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Creator Studio"),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          // 📊 STATS
          stats.when(
            data: (data) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStat("Views", data["views"] ?? 0),
                  _buildStat("Likes", data["likes"] ?? 0),
                  _buildStat("Comments", data["comments"] ?? 0),
                ],
              );
            },
            loading: () => const CircularProgressIndicator(),
            error: (e, _) => Text("Hata: $e"),
          ),

          const SizedBox(height: 20),

          // 🎥 VIDEOS
          Expanded(
            child: videos.when(
              data: (list) {
                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 300,
                      child: VideoCard(video: list[index]),
                    );
                  },
                );
              },
              loading: () =>
                  const Center(child: CircularProgressIndicator()),
              error: (e, _) => Text("Hata: $e"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStat(String label, int value) {
    return Column(
      children: [
        Text(
          "$value",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(label, style: const TextStyle(color: Colors.white70)),
      ],
    );
  }
}