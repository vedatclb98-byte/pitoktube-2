import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/video_provider.dart';
import 'widgets/video_card.dart';

class FeedScreen extends ConsumerWidget {
  final String userId;

  const FeedScreen({
    super.key,
    required this.userId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feed = ref.watch(personalFeedProvider(userId));

    return Scaffold(
      backgroundColor: Colors.black,
      body: feed.when(
        data: (videos) {
          return PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: videos.length,
            itemBuilder: (context, index) {
              return VideoCard(video: videos[index]);
            },
          );
        },
        loading: () =>
            const Center(child: CircularProgressIndicator()),
        error: (e, _) =>
            Center(child: Text("Hata: $e")),
      ),
    );
  }
}