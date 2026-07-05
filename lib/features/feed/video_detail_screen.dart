import 'package:flutter/material.dart';

import 'models/video_model.dart';
import 'widgets/video_actions.dart';
import 'widgets/video_info.dart';

class VideoDetailScreen extends StatelessWidget {
  final VideoModel video;

  const VideoDetailScreen({
    super.key,
    required this.video,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            color: Colors.black,
          ),

          const Center(
            child: Icon(
              Icons.play_circle_fill,
              size: 100,
              color: Colors.white54,
            ),
          ),

          Positioned(
            right: 16,
            bottom: 120,
            child: VideoActions(
              likes: video.likes,
              comments: video.comments,
            ),
          ),

          Positioned(
            left: 16,
            right: 90,
            bottom: 30,
            child: VideoInfo(video: video),
          ),

          SafeArea(
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}