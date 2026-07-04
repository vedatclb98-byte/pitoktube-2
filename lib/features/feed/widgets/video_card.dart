import 'package:flutter/material.dart';

import '../models/video_model.dart';
import 'video_actions.dart';

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
        // Geçici video arka planı
        Container(
          color: Colors.grey.shade900,
        ),

        // Geçici video oynatma simgesi
        const Center(
          child: Icon(
            Icons.play_circle_fill,
            size: 90,
            color: Colors.white54,
          ),
        ),

        // Sağ taraftaki aksiyon butonları
        Positioned(
          right: 16,
          bottom: 110,
          child: VideoActions(
            likes: video.likes,
            comments: video.comments,
          ),
        ),

        // Sol alttaki video bilgileri
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
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                video.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}