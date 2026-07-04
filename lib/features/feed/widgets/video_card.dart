import 'package:flutter/material.dart';

class VideoCard extends StatelessWidget {
  final String username;
  final String description;
  final int likes;
  final int comments;

  const VideoCard({
    super.key,
    required this.username,
    required this.description,
    required this.likes,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [

        Container(
          color: Colors.grey.shade900,
        ),

        Center(
          child: const Icon(
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

              const SizedBox(height: 18),

              const Icon(Icons.favorite_border,size:36),

              Text("$likes"),

              const SizedBox(height:18),

              const Icon(Icons.chat_bubble_outline,size:36),

              Text("$comments"),

              const SizedBox(height:18),

              const Icon(Icons.share,size:36),
            ],
          ),
        ),

        Positioned(
          left:16,
          bottom:30,
          right:90,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                username,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize:18,
                ),
              ),

              const SizedBox(height:8),

              Text(description),
            ],
          ),
        ),
      ],
    );
  }
}