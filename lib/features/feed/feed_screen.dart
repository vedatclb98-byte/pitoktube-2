import 'package:flutter/material.dart';

import 'services/feed_service.dart';
import 'widgets/video_card.dart';
import 'widgets/video_player_widget.dart';

class FeedScreen extends StatelessWidget {
  FeedScreen({super.key});

  final FeedService _service = FeedService();

  @override
  Widget build(BuildContext context) {
    final videos = _service.loadFeed();

    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return Stack(
            fit: StackFit.expand,
            children: [
              VideoPlayerWidget(
                videoUrl: videos[index].videoUrl,
              ),
              VideoCard(
                video: videos[index],
              ),
            ],
          );
        },
      ),
    );
  }
}