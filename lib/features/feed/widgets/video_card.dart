import 'dart:async';

import 'package:flutter/material.dart';

import '../models/video_model.dart';
import 'animated_heart.dart';
import 'video_actions.dart';
import 'video_info.dart';

class VideoCard extends StatefulWidget {
  final VideoModel video;

  const VideoCard({
    super.key,
    required this.video,
  });

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  bool _showHeart = false;

  void _onDoubleTap() {
    setState(() {
      _showHeart = true;
    });

    Timer(const Duration(milliseconds: 700), () {
      if (!mounted) return;

      setState(() {
        _showHeart = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final video = widget.video;

    return GestureDetector(
      onDoubleTap: _onDoubleTap,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Geçici video arka planı
          Container(
            color: Colors.grey.shade900,
          ),

          // Geçici video simgesi
          const Center(
            child: Icon(
              Icons.play_circle_fill,
              size: 90,
              color: Colors.white54,
            ),
          ),

          // Çift dokununca görünen kalp
          AnimatedHeart(
            visible: _showHeart,
          ),

          // Sağ taraftaki butonlar
          Positioned(
            right: 16,
            bottom: 110,
            child: VideoActions(
              likes: video.likes,
              comments: video.comments,
            ),
          ),

          // Sol alttaki bilgiler
          Positioned(
            left: 16,
            right: 90,
            bottom: 30,
            child: VideoInfo(
              video: video,
            ),
          ),
        ],
      ),
    );
  }
}