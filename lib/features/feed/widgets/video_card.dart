import 'package:flutter/material.dart';
import '../models/video_model.dart';

class VideoCard extends StatelessWidget {
  final VideoModel video;

  const VideoCard({
    super.key,
    required this.video,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(color: Colors.grey.shade900),

        const Center(
          child: Icon(
            Icons.play_circle_fill,
            size: 90,
            color: Colors.white54,
          ),
        ),

        Positioned(
          right: 16,
          bottom: 120,
          child: Column(
            children: [
              const CircleAvatar(
                radius: 24,
                child: Icon(Icons.person),
              ),

              const SizedBox(height: 16),

              const Icon(Icons.favorite_border, size: 36),
              Text("${video.likes}"),

              const SizedBox(height: 16),

              const Icon(Icons.chat_bubble_outline, size: 36),
              Text("${video.comments}"),

              const SizedBox(height: 16),

              const Icon(Icons.share, size: 36),
            ],
          ),
        ),

        Positioned(
          left: 16,
          right: 90,
          bottom: 30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                video.username,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 8),

              Text(video.description),
            ],
          ),
        ),
      ],
    );
  }
}