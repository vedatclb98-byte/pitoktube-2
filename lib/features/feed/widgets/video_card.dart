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
          // Karartma efekti
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.15),
                  Colors.black.withOpacity(0.75),
                ],
              ),
            ),
          ),

          // Çift dokunma kalbi
          AnimatedHeart(
            visible: _showHeart,
          ),

          // Sağ taraftaki butonlar
          Positioned(
            right: 16,
            bottom: 110,
            child: VideoActions(
              videoId: video.id,
              likes: video.likes,
              comments: video.comments,
            ),
          ),

          // Sol alt bilgiler
          Positioned(
            left: 16,
            right: 90,
            bottom: 30,
            child: VideoInfo(video: video),
          ),
        ],
      ),
    );
  }
}