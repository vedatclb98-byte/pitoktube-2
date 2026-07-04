import 'package:flutter/material.dart';
import 'like_button.dart';

class VideoActions extends StatelessWidget {
  final int likes;
  final int comments;

  const VideoActions({
    super.key,
    required this.likes,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 26,
          child: Icon(Icons.person),
        ),

        const SizedBox(height: 16),

        LikeButton(
          initialLikes: likes,
        ),

        const SizedBox(height: 18),

        const Icon(
          Icons.chat_bubble_outline,
          size: 36,
        ),

        Text(
          "$comments",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 18),

        const Icon(
          Icons.share,
          size: 36,
        ),

        const SizedBox(height: 18),

        const Icon(
          Icons.bookmark_border,
          size: 36,
        ),
      ],
    );
  }
}