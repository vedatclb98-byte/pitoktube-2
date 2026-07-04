import 'package:flutter/material.dart';

import '../models/video_model.dart';
import 'follow_button.dart';

class VideoInfo extends StatelessWidget {
  final VideoModel video;

  const VideoInfo({
    super.key,
    required this.video,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              video.username,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(width: 12),

            const FollowButton(),
          ],
        ),

        const SizedBox(height: 10),

        Text(
          video.description,
          style: const TextStyle(
            fontSize: 15,
          ),
        ),

        const SizedBox(height: 10),

        const Row(
          children: [
            Icon(
              Icons.music_note,
              size: 18,
              color: Colors.white70,
            ),
            SizedBox(width: 6),
            Expanded(
              child: Text(
                "Original Sound • PitokTube",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}