import 'dart:async';
import 'package:flutter/material.dart';

import '../models/video_model.dart';
import 'animated_heart.dart';
import 'video_actions.dart';
import 'video_info.dart';
import '../video_detail_screen.dart';

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

  void _openVideoDetail() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => VideoDetailScreen(video: widget.video),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final video = widget.video;

    return GestureDetector(
      onTap: _openVideoDetail,
      onDoubleTap: _onDoubleTap,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Arka plan gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.2),
                  Colors.black.withOpacity(0.8),
                ],
              ),
            ),
          ),

          // Kalp animasyonu
          AnimatedHeart(
            visible: _showHeart,
          ),

          // Sağ taraf butonlar
          Positioned(
            right: 16,
            bottom: 110,
            child: VideoActions(
              videoId: video.id,
              likes: video.likes,
              comments: video.comments,
            ),
          ),

          // Sol alt bilgi
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