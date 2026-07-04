import 'package:flutter/material.dart';

import 'services/feed_service.dart';
import 'widgets/video_card.dart';

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
          return VideoCard(video: videos[index]);
        },
      ),
    );
  }
}