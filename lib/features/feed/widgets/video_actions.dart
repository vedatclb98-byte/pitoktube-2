import 'package:flutter/material.dart';

import 'bookmark_button.dart';
import 'comments_bottom_sheet.dart';
import 'like_button.dart';
import 'share_bottom_sheet.dart';

class VideoActions extends StatelessWidget {
  final int likes;
  final int comments;

  const VideoActions({
    super.key,
    required this.likes,
    required this.comments,
  });

  String _formatCount(int value) {
    if (value >= 1000000) {
      return "${(value / 1000000).toStringAsFixed(1)}M";
    }
    if (value >= 1000) {
      return "${(value / 1000).toStringAsFixed(1)}K";
    }
    return value.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 28,
          backgroundColor: Color(0xFF7C3AED),
          child: Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),

        const SizedBox(height: 10),

        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 3,
          ),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Text(
            "Takip Et",
            style: TextStyle(
              fontSize: 10,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const SizedBox(height: 18),

        LikeButton(
          initialLikes: likes,
        ),

        Text(
          _formatCount(likes),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 18),

        IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (_) => const CommentsBottomSheet(),
            );
          },
          icon: const Icon(
            Icons.chat_bubble_outline,
            size: 36,
          ),
        ),

        Text(
          _formatCount(comments),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 18),

        IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              builder: (_) => const ShareBottomSheet(),
            );
          },
          icon: const Icon(
            Icons.share,
            size: 36,
          ),
        ),

        const SizedBox(height: 18),

        const BookmarkButton(),

        const SizedBox(height: 18),

        IconButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("🪙 Pi Tip özelliği yakında geliyor"),
              ),
            );
          },
          icon: const Icon(
            Icons.currency_exchange,
            color: Color(0xFF7C3AED),
            size: 36,
          ),
        ),

        const Text(
          "Tip",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}